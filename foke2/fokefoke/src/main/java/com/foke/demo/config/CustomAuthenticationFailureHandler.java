package com.foke.demo.config;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        // 실패한 결과를 원하는 동작으로 처리
        // 예: 실패 메시지 출력, 로깅 등
        response.sendError(HttpStatus.UNAUTHORIZED.value(), "Authentication failed");
    }
}
