package com.agrismart.app.controllers;

import com.agrismart.app.dto.OtpRequest;
import com.agrismart.app.dto.VerifyOtpRequest;
import com.agrismart.app.services.OtpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin("*")
public class AuthController {

    @Autowired
    private OtpService otpService;

    // Envoi OTP (mock)
    @PostMapping("/send-otp")
    public String sendOtp(@RequestBody OtpRequest request) {
        return otpService.sendOtp(request.getPhone());
    }

    // Vérification OTP
    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestBody VerifyOtpRequest request) {
        return otpService.verifyOtp(request.getPhone(), request.getOtp());
    }
}

