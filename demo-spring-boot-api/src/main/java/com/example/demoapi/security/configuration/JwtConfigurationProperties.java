package com.example.demoapi.security.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.ConstructorBinding;

@ConfigurationProperties("api.jwt")
@ConstructorBinding
public record JwtConfigurationProperties (
        String[] issuerUris
) {}
