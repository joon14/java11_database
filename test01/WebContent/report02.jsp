<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, java.sql.*" %>
<%@ page import="org.kh.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "c##sqltest";
	String userpw = "20240326";
	String sql = "";
	
	List<Datafile> dList = new ArrayList<>();
	List<Controlfile> cList = new ArrayList<>();
	List<Logfile> lList = new ArrayList<>();
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(url, userid, userpw);
		
		sql = "select creation_time, status, enabled, bytes, blocks, create_bytes, block_size, name, con_id from v$datafile";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Datafile data = new Datafile(rs.getString("creation_time"), 
					rs.getString("status"),
					rs.getString("enabled"), 
					rs.getInt("bytes"), 
					rs.getInt("blocks"), 
					rs.getInt("create_bytes"), 
					rs.getInt("block_size"), 
					rs.getString("name"),
					rs.getInt("con_id"));
			
			dList.add(data);
		}
		
		pstmt = null;
		rs = null;
		
		sql = "select name, is_recovery_dest_file, block_size, file_size_blks, con_id from v$controlfile";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Controlfile data = new Controlfile(rs.getString("name"), 
					rs.getString("is_recovery_dest_file"),
					rs.getInt("block_size"), 
					rs.getInt("file_size_blks"), 
					rs.getInt("con_id"));
			
			cList.add(data);
		}
		
		pstmt = null;
		rs = null;
		
		sql = "select type, member, is_recovery_dest_file, con_id from v$logfile";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Logfile data = new Logfile(rs.getString("type"), 
					rs.getString("member"),
					rs.getString("is_recovery_dest_file"),
					rs.getInt("con_id"));
			
			lList.add(data);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(con!=null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	pageContext.setAttribute("dList", dList);
	pageContext.setAttribute("cList", cList);
	pageContext.setAttribute("lList", lList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBMS 점검 보고서</title>
<style>
	.title { text-align:center; }
	.tb th {border-top:3px solid#333; border-bottom:3px solid#333; line-height:40px;}
    .tb td {border-bottom:1px solid#333; line-height:30px; text-align: center;}
	hr { clear:both; width:100%; margin:30px 0px; padding:0; }
</style>
</head>
<body>
<h1 class="title">DBMS 점검 보고서</h1>
<hr>
<%@ include file="menu.jsp" %>
<hr>
<h2 class="title">Datafile 목록</h2>
<table style="width:1200px; margin:30px auto" class="tb">
	<thead>
		<tr>
			<th>creation_time</th>
			<th>status</th>
			<th>enabled</th>
			<th>bytes</th>
			<th>blocks</th>
			<th>create_bytes</th>
			<th>block_size</th>
			<th>name</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="data" items="${dList }" varStatus="status">
		<tr>
			<td>${data.creation_time }</td>
			<td>${data.status }</td>
			<td>${data.enabled }</td>
			<td>${data.bytes }</td>
			<td>${data.blocks }</td>
			<td>${data.create_bytes }</td>
			<td>${data.block_size }</td>
			<td>${data.name }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<hr>
<h2 class="title">Controlfile 목록</h2>
<table style="width:1200px; margin:30px auto" class="tb">
	<thead>
		<tr>
			<th>name</th>
			<th>is_recovery_dest_file</th>
			<th>block_size</th>
			<th>file_size_blks</th>
			<th>con_id</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="data" items="${cList }" varStatus="status">
		<tr>
			<td>${data.name }</td>
			<td>${data.is_recovery_dest_file }</td>
			<td>${data.block_size }</td>
			<td>${data.file_size_blks }</td>
			<td>${data.con_id }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<hr>
<h2 class="title">Logfile 목록</h2>
<table style="width:1200px; margin:30px auto" class="tb">
	<thead>
		<tr>
			<th>type</th>
			<th>member</th>
			<th>is_recovery_dest_file</th>
			<th>con_id</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="data" items="${lList }" varStatus="status">
		<tr>
			<td>${data.type }</td>
			<td>${data.member }</td>
			<td>${data.is_recovery_dest_file }</td>
			<td>${data.con_id }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>