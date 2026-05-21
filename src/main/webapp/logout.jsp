<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 초기화 (로그아웃 처리)
    session.invalidate();
    
    // 시작 페이지(로그인 화면)로 리다이렉트
    response.sendRedirect("login.jsp");
%>