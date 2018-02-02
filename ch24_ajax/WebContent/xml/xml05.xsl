<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>제품 내역서</title>
			</head>
			<body>
				<br />
				<p align="center">
					<font color="#fa4c79" size="6">핸드폰 리스트</font>
				</p>
				<br />
				<table align="center" border="1" cellspacing="2" cellpaddind="5">
					<thead>
						<tr>
							<th bgcolor="navy">
								<font color="white">모델명</font>
							</th>
							<th bgcolor="navy">
								<font color="white">통신사</font>
							</th>
							<th bgcolor="navy">
								<font color="white">구입형태</font>
							</th>
							<th bgcolor="navy">
								<font color="white">제조사</font>
							</th>
							<th bgcolor="navy">
								<font color="white">색상</font>
							</th>
							<th bgcolor="navy">
								<font color="white">수량</font>
							</th>
							<th bgcolor="navy">
								<font color="white">가격</font>
							</th>
							<th bgcolor="navy">
								<font color="white">이미지</font>
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="/제품/핸드폰" />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="/제품/핸드폰">
		<tr>
			<td>
				<xsl:value-of select="모델명" />
			</td>
			<td>
				<xsl:value-of select="통신사" />
			</td>
			<td>
				<xsl:value-of select="구입형태" />
			</td>
			<td>
				<xsl:value-of select="제조사" />
			</td>
			<td>
				<xsl:value-of select="색상" />
			</td>
			<td>
				<xsl:value-of select="수량" />
			</td>
			<td>
				<xsl:value-of select="가격" />
			</td>
			<td>
				<img src="{이미지}" />
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>