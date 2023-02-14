<%@ page contentType="text/html; charset=utf-8" %><%@ include file="./init.jsp" %><%

    String imageUrl = "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png";
    String destinationFile = "D:\\home\\newexam\\public_html\\data\\file\\Myimage1.jpg";

    try {
        URL url = new URL(imageUrl);
        InputStream inputStream = url.openStream();
        OutputStream outputStream = new FileOutputStream(destinationFile);

        byte[] buffer = new byte[2048];
        int length;

        while ((length = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, length);
        }

        inputStream.close();
        outputStream.close();
    } catch (IOException e) {
        e.printStackTrace();
    }


%>