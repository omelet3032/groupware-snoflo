package org.snoflo.groupware.system;

import org.snoflo.groupware.dto.LoginResult;
import org.snoflo.groupware.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class WelcomeController {

    private LoginService loginService;

    public WelcomeController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("/")
    public String welcome() {
        return "index";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {

        LoginResult result = loginService.login(email, password);

        if (!result.isSuccess()) {
            // 로그인 실패: 에러 메시지를 모델에 추가
            model.addAttribute("error", "Invalid email or password");
            return "index"; // 로그인 페이지로 다시 이동
        }

        boolean isAdmin = result.getRole().equals("관리자");

        if (isAdmin) {
            return "redirect:/admin/homeAdmin"; // 대시보드 페이지로 리다이렉트
        } else {
            return "redirect:/user/homeUser";
        }

    }

    @GetMapping("/admin/homeAdmin")
    public String homeAdmin() {
        return "admin/homeAdmin";
    }


    @GetMapping("/user/homeUser")
    public String homeUser() {
        return "user/homeUser";
    }

}
