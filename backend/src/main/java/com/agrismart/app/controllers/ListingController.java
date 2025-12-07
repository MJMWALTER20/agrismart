package com.agrismart.app.controllers;

import com.agrismart.app.dto.CreateListingRequest;
import com.agrismart.app.entities.Listing;
import com.agrismart.app.services.ListingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/listings")
@CrossOrigin("*")
public class ListingController {

    @Autowired
    private ListingService listingService;

    @PostMapping("/create")
    public Listing createListing(@RequestBody CreateListingRequest req) {
        return listingService.createListing(
                req.getPhone(),
                req.getTitle(),
                req.getDescription(),
                req.getPrice(),
                req.getCategory()
        );
    }

    @GetMapping("/")
    public List<Listing> getAll() {
        return listingService.getAll();
    }

    @GetMapping("/{phone}")
    public List<Listing> getByProducer(@PathVariable String phone) {
        return listingService.getByProducer(phone);
    }
}
