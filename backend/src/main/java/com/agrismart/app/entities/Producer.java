package com.agrismart.app.entities;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "producers")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Producer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    private String region;
    private String village;

    private Double gpsLatitude;
    private Double gpsLongitude;

    private Float landArea;

    private String mainCrops;

    private LocalDateTime createdAt = LocalDateTime.now();
}

