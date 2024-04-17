package richngo.api;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import common.JdbcTemplate;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class BuildingRegisterTitleAPI {
    public static void main(String[] args) {
    	try {
            // 법정동 코드를 파일에서 읽어오기
//            List<String> lawdCodeList = LawdCodeReaderController.readFile("C:\\workspace\\Java\\richngo\\src\\main\\webapp\\WEB-INF\\resources\\지역별코드.txt");
    		List<String> lawdCodeList = LawdCodeReader.readFile("C:/workspace/Java/richngo/src/main/webapp/resources/지역별코드.txt");
            for (String lawdCode : lawdCodeList) {
                String xmlData = getXmlData(lawdCode); // API 호출하여 XML 데이터 가져오기
                insertDataToDatabase(xmlData); // XML 데이터베이스에 삽입
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
	public static String getXmlData(String lawdCode) throws Exception {
    	Properties prop = new Properties();
        try (InputStream input = ApartmentTransactioPriceAPI.class.getClassLoader().getResourceAsStream("common/driver.properties")) {
            prop.load(input);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
        // TODO 시군구 완료 , 번지동 리스트 찾는중
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrTitleInfo"); /* URL */
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + URLEncoder.encode(prop.getProperty("openapi.serviceKey.common"), "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("sigunguCd", "UTF-8") + "=" + URLEncoder.encode(lawdCode, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("bjdongCd", "UTF-8") + "=" + URLEncoder.encode("10300", "UTF-8")); /* 행정표준코드 */

//		위는 필수 요청 목록(상세하게 검색하지 않을 시 행정표준코드에 해당하는 모든 데이터를 반환. 테스트 완료)

//		urlBuilder.append("&" + URLEncoder.encode("platGbCd", "UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /* 0:대지 1:산 2:블록 */
//		urlBuilder.append("&" + URLEncoder.encode("bun", "UTF-8") + "=" + URLEncoder.encode("0012", "UTF-8")); /* 번 */
//		urlBuilder.append("&" + URLEncoder.encode("ji", "UTF-8") + "=" + URLEncoder.encode("0000", "UTF-8")); /* 지 */
//		urlBuilder.append("&" + URLEncoder.encode("startDate", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* YYYYMMDD */
//		urlBuilder.append("&" + URLEncoder.encode("endDate", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* YYYYMMDD */
//		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 페이지당 목록 수 */
//		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        return sb.toString();
    }
	private static void insertDataToDatabase(String xmlData) throws Exception {
        Connection conn = null;
        try {
            conn = JdbcTemplate.getSemiConnection(true); // 로컬 데이터베이스 연결

            // XML 파싱
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new ByteArrayInputStream(xmlData.getBytes()));

            // XML 요소 추출
            NodeList itemList = doc.getElementsByTagName("item");
            for (int i = 0; i < itemList.getLength(); i++) {
                Element item = (Element) itemList.item(i);

                // 각 항목에서 필요한 데이터 추출
                String resultCode = getElementValue(item, "resultCode");
                String resultMsg = getElementValue(item, "resultMsg");
                String dealAmount = getElementValue(item, "거래금액");
                String buildYear = getElementValue(item, "건축년도");
                String dealYear = getElementValue(item, "년");
                String dong = getElementValue(item, "법정동");
                String apartmentName = getElementValue(item, "아파트");
                String dealMonth = getElementValue(item, "월");
                String dealDay = getElementValue(item, "일");
                String areaForExclusiveUse = getElementValue(item, "전용면적");
                String jibun = getElementValue(item, "지번");
                String regionalCode = getElementValue(item, "지역코드");
                String floor = getElementValue(item, "층");
                String cancelDealType = getElementValue(item, "해제여부");
                String cancelDealDay = getElementValue(item, "해제사유발생일");
                String reqGbn = getElementValue(item, "거래유형");
                String rdealerLawdnm = getElementValue(item, "중개사소재지");
                String registrationDate = getElementValue(item, "등기일자");

                // SQL 쿼리 실행
//                String insertQuery = "INSERT INTO ApartmentTransactioPrice (resultCode, resultMsg, DealAmount, BuildYear, DealYear, Dong, ApartmentName, DealMonth, DealDay, AreaForExclusiveUse, Jibun, RegionalCode, Floor, CancelDealType, CancelDealDay, REQ_GBN, RdealerLawdnm, RegistrationDate) " +
//                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//                PreparedStatement pstmt = conn.prepareStatement(insertQuery);
                // XML 파싱 후 데이터베이스에 삽입
                // String 형식으로 값을 설정합니다.
//                pstmt.setString(1, resultCode); // resultCode
//                pstmt.setString(2, resultMsg); // resultMsg
//                // dealAmount에 쉼표를 제거하고 정수로 변환
//                String dealAmountValue = dealAmount.replace(",", "");
//                pstmt.setInt(3, Integer.parseInt(dealAmountValue)); // DealAmount
//                // buildYear는 이미 문자열 형태이므로 정수로 변환
//                pstmt.setInt(4, Integer.parseInt(buildYear)); // BuildYear
//                pstmt.setString(5, dealYear); // DealYear
//                pstmt.setString(6, dong); // Dong
//                pstmt.setString(7, apartmentName); // ApartmentName
//                pstmt.setString(8, dealMonth); // DealMonth
//                pstmt.setString(9, dealDay); // DealDay
//                pstmt.setString(10, areaForExclusiveUse); // AreaForExclusiveUse
//                pstmt.setString(11, jibun); // Jibun
//                pstmt.setString(12, regionalCode); // RegionalCode
//                pstmt.setString(13, floor); // Floor
//                pstmt.setString(14, cancelDealType); // CancelDealType
//                pstmt.setString(15, cancelDealDay); // CancelDealDay
//                pstmt.setString(16, reqGbn); // REQ_GBN
//                pstmt.setString(17, rdealerLawdnm); // RdealerLawdnm
//                pstmt.setString(18, registrationDate); // RegistrationDate
//                pstmt.executeUpdate();
//                pstmt.close();
                }
            System.out.println("Data inserted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
 // XML 요소의 값을 가져오는 도우미 메서드
    private static String getElementValue(Element parentElement, String tagName) {
        NodeList nodeList = parentElement.getElementsByTagName(tagName);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent().trim();
        }
        return ""; // 해당 태그가 없는 경우 빈 문자열 반환
    }
	 // 데이터베이스 연결을 위한 메서드
    public static Connection getSemiConnection() throws Exception {
    	Connection conn = null;
    	JdbcTemplate.getConnection();
    	return conn;
    }
}