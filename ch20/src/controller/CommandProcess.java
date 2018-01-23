package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 객체의 다형성을 이용하기 위한 인터페이스 생성
/* 서비스 처리를 위한 객체들의 부모 인터페이스 */
public interface CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
