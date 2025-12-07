package com.agrismart.app.services;

import com.agrismart.app.entities.Producer;
import com.agrismart.app.entities.User;
import com.agrismart.app.repositories.ProducerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProducerService {

    @Autowired
    private ProducerRepository producerRepository;

    @Autowired
    private UserService userService;

    // Crée un producer si l'utilisateur n'en a pas déjà
    public Producer createProducerIfNotExists(String phone) {
        User user = userService.getUserByPhone(phone);
        if (user == null) return null;

        // Vérifier si un producteur existe déjà
        Producer existing = producerRepository.findByUser(user).orElse(null);
        if (existing != null) {
            return existing;
        }

        // Sinon créer un nouveau producteur vide
        Producer producer = new Producer();
        producer.setUser(user);

        return producerRepository.save(producer);
    }

    // Récupérer producteur via numéro
    public Producer getByPhone(String phone) {
        User user = userService.getUserByPhone(phone);
        if (user == null) return null;

        return producerRepository.findByUser(user).orElse(null);
    }

    // Mettre à jour profil producteur
    public Producer updateProfile(String phone, Producer updated) {
        Producer existing = getByPhone(phone);
        if (existing == null) return null;

        existing.setRegion(updated.getRegion());
        existing.setVillage(updated.getVillage());
        existing.setGpsLatitude(updated.getGpsLatitude());
        existing.setGpsLongitude(updated.getGpsLongitude());
        existing.setLandArea(updated.getLandArea());
        existing.setMainCrops(updated.getMainCrops());

        return producerRepository.save(existing);
    }
}

