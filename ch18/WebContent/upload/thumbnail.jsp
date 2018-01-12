<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.awt.Graphics2D"%>
<%@ page import="java.awt.image.renderable.ParameterBlock"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.media.jai.JAI"%>
<%@ page import="javax.media.jai.RenderedOp"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<% 
	String imagePath=getServletContext().getRealPath("/fileSave"); 
	int size = 2*1024*1024 ; 
	String filename=""; 
	try{ 
		MultipartRequest multi=new MultipartRequest(request,
			imagePath,size,"utf-8", 
			new DefaultFileRenamePolicy()); 
		Enumeration files=multi.getFileNames(); 
		String file =(String)files.nextElement(); 
		filename=multi.getFilesystemName(file); 
	}catch(Exception e){ e.printStackTrace(); } 
	// 이 클래스에 변환할 이미지를 담는다.(이미지는 ParameterBlock을 통해서만 담을수 있다.)
	ParameterBlock pb=new ParameterBlock();
	// 서버에 저장된 원본파일의 경로로 파라메터블록에 추가
	//위에서 가져온 파일이름을 받아서 이미지페스에 지정한 폴더속에 파일을 만들어줌
	pb.add(imagePath+"/"+filename);
	//자이로 파라메터블록을 로드하여 RenderedOp 에 삽입
	RenderedOp rOp=JAI.create("fileload",pb); 
	//불러온 이미지를 BuffedImage에 담는다.
	BufferedImage bi= rOp.getAsBufferedImage();
	//thumb라는 이미지 버퍼를 생성, 버퍼의 사이즈는 100*100으로 설정.
	BufferedImage thumb=new BufferedImage(100,100,
			BufferedImage.TYPE_INT_RGB); 
	Graphics2D g=thumb.createGraphics(); 
	//버퍼사이즈 100*100으로 맞춰 그리자
	g.drawImage(bi,0,0,100,100,null); 
	/*출력할 위치와 파일이름을 설정하고 섬네일 이미지를 생성한다. 저장하는 타입을 jpg로 설정.*/
	 //그 변형한 파일을 파일명 변경시킨다
	File file=new File(imagePath+"/sm_"+filename); 
	//버퍼공간의 영역에 변경한 이미지 파일명을 불러와 jpg속성으로 출력시킨다
	ImageIO.write(thumb,"jpg",file); 
%>
<html>
<head>
<title>이미지 썸네일 예제</title>
</head>
<body>
	-원본 이미지-
	<br>
	<img src="../fileSave/<%=filename %>">
	<p>
		-썸네일 이미지-<br> <img src="../fileSave/sm_<%=filename %>">
</body>
</html>