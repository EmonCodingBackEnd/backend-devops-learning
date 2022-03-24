package com.coidng.devops.user.response;

public class LoginResponse extends Response {

    private static final long serialVersionUID = 8177225397769765954L;

    private String token;

    public LoginResponse(String token) {
        this.token = token;
    }
}
