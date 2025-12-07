package com.agrismart.app.repositories;

import com.agrismart.app.entities.Listing;
import com.agrismart.app.entities.Producer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListingRepository extends JpaRepository<Listing, Long> {
    List<Listing> findByProducer(Producer producer);
    List<Listing> findByCategory(String category);
}
