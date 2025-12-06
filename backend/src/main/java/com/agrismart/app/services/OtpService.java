package com.agrismart.app.services;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class OtpService {

    private final Map<String, String> otpStorage = new HashMap<>();

    // Génération OTP mock
    public String sendOtp(String phone) {
        String otp = String.valueOf(1000 + new Random().nextInt(9000));
        otpStorage.put(phone, otp);
        return "OTP envoyé (mock) : " + otp;
    }

    // Vérification OTP
    public String verifyOtp(String phone, String otp) {
        if (!otpStorage.containsKey(phone))
            return "Aucun OTP envoyé à ce numéro.";

        if (otpStorage.get(phone).equals(otp))
            return "OTP valide. Authentification réussie.";

        return "OTP invalide.";
    }
}

