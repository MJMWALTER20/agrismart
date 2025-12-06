package com.agrismart.app.services;

import com.agrismart.app.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class OtpService {

    private final Map<String, String> otpStorage = new HashMap<>();

    @Autowired
    private UserService userService;

    // Envoyer OTP (mock)
    public String sendOtp(String phone) {
        String otp = String.valueOf(1000 + new Random().nextInt(9000));
        otpStorage.put(phone, otp);
        return "OTP envoyé (mock) : " + otp;
    }

    // Vérification OTP + création automatique d'un user
    public String verifyOtp(String phone, String otp) {

        if (!otpStorage.containsKey(phone))
            return "Aucun OTP envoyé à ce numéro.";

        if (!otpStorage.get(phone).equals(otp))
            return "OTP invalide.";

        // OTP VALIDE → création utilisateur
        User user = userService.createUserIfNotExists(phone);

        return "Authentification réussie. USER_ID = " + user.getId();
    }
}
