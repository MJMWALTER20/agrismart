package com.agrismart.app.repositories;

import com.agrismart.app.entities.Producer;
import com.agrismart.app.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProducerRepository extends JpaRepository<Producer, Long> {
    Optional<Producer> findByUser(User user);
}
