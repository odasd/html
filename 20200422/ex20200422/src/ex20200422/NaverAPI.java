package ex20200422;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.*;
import java.net.*;
import java.io.*;

public class NaverAPI{

	 public static String search(String url, String query, String display, String start) {
	        String clientId = "SN8tQF7cDqTjHql2LkLD"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
	        String clientSecret = "t2Mo_ytnoR"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"

	        String text = null;
	        try {
	            text = URLEncoder.encode(query, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("�˻��� ���ڵ� ����",e);
	        }

	        String apiURL = url + "?query=" + text;    // json ���
	        apiURL += "&display=" + display;
	        apiURL += "&start=" + start;
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���

	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        System.out.println(responseBody);
	        return responseBody;
	    }

	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
	                return readBody(con.getInputStream());
	            } else { // ���� �߻�
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API ��û�� ���� ����", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body) throws UnsupportedEncodingException{
	        InputStreamReader streamReader = new InputStreamReader(body, "UTF-8");

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
	        }
	    }
	
}