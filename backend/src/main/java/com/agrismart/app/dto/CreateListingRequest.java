package com.agrismart.app.dto;

import lombok.Data;

@Data
public class CreateListingRequest {
    private String phone;
    private String title;
    private String description;
    private Double price;
    private String category;
}
