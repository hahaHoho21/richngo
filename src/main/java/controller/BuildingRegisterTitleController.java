package controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;
import java.util.Properties;

import common.JdbcTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;

public class BuildingRegisterTitleController {
	public static void main(String[] args) throws IOException {
		Properties prop = new Properties();
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrTitleInfo"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + URLEncoder.encode("5/2ZQI/3ERhHWf5sZUCImAHVK5SNcbc+o8W1zCDP4G12ZhIaFupm3sgvzjwFYTSPACF4EctexvJ3WJSNlAiuzw==", "UTF-8"));		
		urlBuilder.append("&" + URLEncoder.encode("sigunguCd", "UTF-8") + "=" + URLEncoder.encode("11680", "UTF-8")); /* 행정표준코드 */
		urlBuilder.append("&" + URLEncoder.encode("bjdongCd", "UTF-8") + "=" + URLEncoder.encode("10300", "UTF-8")); /* 행정표준코드 */
		urlBuilder.append("&" + URLEncoder.encode("platGbCd", "UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /* 0:대지 1:산 2:블록 */
		urlBuilder.append("&" + URLEncoder.encode("bun", "UTF-8") + "=" + URLEncoder.encode("0012", "UTF-8")); /* 번 */
		urlBuilder.append("&" + URLEncoder.encode("ji", "UTF-8") + "=" + URLEncoder.encode("0000", "UTF-8")); /* 지 */
		urlBuilder.append("&" + URLEncoder.encode("startDate", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* YYYYMMDD */
		urlBuilder.append("&" + URLEncoder.encode("endDate", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* YYYYMMDD */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 페이지당 목록 수 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
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
	}
	 // 데이터베이스 연결을 위한 메서드
    public static Connection getSemiConnection() throws Exception {
    	Connection conn = null;
    	JdbcTemplate.getConnection();
    	return conn;
    }
}