package com.DG.dangil1009.common;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;

public class test {

    
    public static void main(String[] args) throws IOException {
    	File file = new File("C:\\Users\\iceperfume\\Desktop\\asdf.jpg");
    	//String boxes = "{\"result\":{\"boxes\":[[[97,665],[527,665],[527,682],[97,682]],[[470,612],[570,612],[570,632],[470,632]],[[655,607],[730,607],[730,635],[655,635]],[[207,300],[295,300],[295,390],[207,390]],[[312,290],[572,290],[572,390],[312,390]],[[320,195],[525,195],[525,270],[320,270]],[[220,100],[355,100],[355,170],[220,170]],[[372,97],[588,100],[587,175],[371,172]]]}}";
    	String boxes = new test().getImageInfoByFilePath("C:\\Users\\iceperfume\\Desktop\\asdf.jpg");
    	System.out.println(new test().getTexts(file, boxes));
    	
    }
    
    private String getImageInfoByFilePath(String filePath){
    	String dump = "";
    	  try{
    	   File imageFile = new File(filePath);
    	   if(imageFile.exists()){
    	    BufferedImage bi = ImageIO.read(new File(filePath));
    	    dump = "boxes=[[[0,0],["+bi.getWidth()+",0],["+bi.getWidth()+","+bi.getHeight()+"],[0,"+bi.getHeight()+"]]]";
    	   }
    	   
    	   return dump;
    	     }catch(Exception e){
    	   return null;
    	  }
    	 }

    public String getTexts(File file, String boxes) throws IOException {

        if (file.length() == 0)
            return null;
       // String url2 = "https://kapi.kakao.com/v1/vision/text/detect";
        String url2 = "https://kapi.kakao.com/v1/vision/text/recognize?" + boxes;
    	//https://kapi.kakao.com/v1/vision/text/recognize
        String accessToken = "40e212f1c40ad526d5c9699a0813fde2";
        String CRLF = "\r\n";
        String TWO_HYPHENS = "--";
        String BOUNDARY = "---------------------------012345678901234567890123456";
        HttpsURLConnection conn = null;
        DataOutputStream dos = null;
        FileInputStream fis = null;
        

        int bytesRead, bytesAvailable, bufferSize;
        byte[] buffer;
        int maxBufferSize = 1 * 1024 * 1024;

        // Request
        try {
            URL url = new URL(url2) ;
            conn = (HttpsURLConnection) url.openConnection();
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + BOUNDARY);
            conn.setRequestProperty("Authorization", "KakaoAK " + accessToken);
            conn.setRequestProperty("Cache-Control", "no-cache");

            dos = new DataOutputStream(conn.getOutputStream());

            System.out.println( file.getName());
        	
            dos.writeBytes(TWO_HYPHENS + BOUNDARY + CRLF);
            dos.writeBytes("Content-Disposition: form-data; name=\"file\";" + " filename=\"" + file.getName() + "\"" + CRLF);
            dos.writeBytes(CRLF);
            
            fis = new FileInputStream(file);
            bytesAvailable = fis.available();
            bufferSize = Math.min(bytesAvailable, maxBufferSize);
            buffer = new byte[bufferSize];
            bytesRead = fis.read(buffer, 0, bufferSize);
            while (bytesRead > 0) {
                dos.write(buffer, 0, bufferSize);
                bytesAvailable = fis.available();
                bufferSize = Math.min(bytesAvailable, maxBufferSize);
                bytesRead = fis.read(buffer, 0, bufferSize);
            }
            dos.writeBytes(CRLF);

            // finish delimiter
            dos.writeBytes(TWO_HYPHENS + BOUNDARY + TWO_HYPHENS + CRLF);

            fis.close();
            dos.flush();
            dos.close();

        } catch (MalformedURLException ex) {
            ex.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            if (dos != null) try { dos.close(); } catch (IOException ignore) {}
            if (fis != null) try { fis.close(); } catch (IOException ignore) {} }

        // Response
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
            inputStream = new BufferedInputStream(conn.getInputStream());
            reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            String line;
            StringBuilder builder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                builder.append(line).append("\n");
            }
            reader.close();
            return builder.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try { reader.close(); } catch (IOException ignore) {}
            }
            if (inputStream != null) {
                try { inputStream.close(); } catch (IOException ignore) {}
            }
            conn.disconnect();
        }
        System.out.println( conn.getResponseCode());
        System.out.println( conn.getResponseMessage());

        return null;
    }
}