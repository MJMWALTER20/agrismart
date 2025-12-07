package com.agrismart.app.controllers;

import com.agrismart.app.dto.ProducerUpdateRequest;
import com.agrismart.app.entities.Producer;
import com.agrismart.app.services.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/producer")
@CrossOrigin("*")
public class ProducerController {

    @Autowired
    private ProducerService producerService;

    // Récupérer profil producteur par téléphone
    @GetMapping("/{phone}")
    public Producer getProducer(@PathVariable String phone) {
        return producerService.getByPhone(phone);
    }

    // Mettre à jour profil
    @PutMapping("/{phone}")
    public Producer updateProfile(@PathVariable String phone,
                                  @RequestBody ProducerUpdateRequest req) {

        Producer updated = new Producer();
        updated.setRegion(req.getRegion());
        updated.setVillage(req.getVillage());
        updated.setGpsLatitude(req.getGpsLatitude());
        updated.setGpsLongitude(req.getGpsLongitude());
        updated.setLandArea(req.getLandArea());
        updated.setMainCrops(req.getMainCrops());

        return producerService.updateProfile(phone, updated);
    }
}

