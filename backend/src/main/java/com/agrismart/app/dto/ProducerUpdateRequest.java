package com.agrismart.app.dto;

import lombok.Data;

@Data
public class ProducerUpdateRequest {
    private String region;
    private String village;
    private Double gpsLatitude;
    private Double gpsLongitude;
    private Float landArea;
    private String mainCrops;
}
