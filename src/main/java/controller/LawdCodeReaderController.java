package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class LawdCodeReaderController {
    public static void main(String[] args) {
        String filePath = "C:\\workspace\\Java\\richngo\\src\\main\\webapp\\WEB-INF\\resources\\지역별코드.txt";
        List<String> lines = readFile(filePath);
        if (lines != null) {
            System.out.println("File contents:");
            for (String line : lines) {
                System.out.println(line);
            }
        } else {
            System.out.println("Failed to read the file.");
        }
    }

    public static List<String> readFile(String filePath) {
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                lines.add(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 파일 읽기 실패
        }
        return lines;
    }
}
