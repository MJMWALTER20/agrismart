package com.agrismart.app.services;

import com.agrismart.app.entities.User;
import com.agrismart.app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Retourne un utilisateur par téléphone
    public User getUserByPhone(String phone) {
        return userRepository.findByPhone(phone).orElse(null);
    }

    // Crée un utilisateur s'il n'existe pas déjà
    public User createUserIfNotExists(String phone) {
        User existingUser = getUserByPhone(phone);

        if (existingUser != null) {
            return existingUser;
        }

        User newUser = new User();
        newUser.setPhone(phone);
        newUser.setRole("PRODUCER"); // rôle par défaut
        newUser.setFullName(null);

        return userRepository.save(newUser);
    }
}

