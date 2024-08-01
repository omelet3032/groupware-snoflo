package org.snoflo.groupware.dto;

public class LoginResult {

    private boolean success;

    private String role;

    public LoginResult() {
    }

    public LoginResult(boolean success) {
        this.success = success;
    }

    public LoginResult(String role) {
        this.role = role;
    }

    public LoginResult(boolean success, String role) {
        this.success = success;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

}
