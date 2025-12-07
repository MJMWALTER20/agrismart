package com.agrismart.app.services;

import com.agrismart.app.entities.Listing;
import com.agrismart.app.entities.Producer;
import com.agrismart.app.repositories.ListingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListingService {

    @Autowired
    private ListingRepository listingRepository;

    @Autowired
    private ProducerService producerService;

    public Listing createListing(String phone, String title, String description, Double price, String category) {
        Producer producer = producerService.getByPhone(phone);
        if (producer == null) return null;

        Listing listing = new Listing();
        listing.setProducer(producer);
        listing.setTitle(title);
        listing.setDescription(description);
        listing.setPrice(price);
        listing.setCategory(category);

        return listingRepository.save(listing);
    }

    public List<Listing> getAll() {
        return listingRepository.findAll();
    }

    public List<Listing> getByProducer(String phone) {
        Producer producer = producerService.getByPhone(phone);
        if (producer == null) return null;

        return listingRepository.findByProducer(producer);
    }
}
