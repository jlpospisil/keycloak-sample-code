package com.example.demoapi.security.tenants;

import com.example.demoapi.security.configuration.JwtConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Optional;

@Service
@EnableConfigurationProperties(JwtConfigurationProperties.class)
public class TenantService {

    private final JwtConfigurationProperties jwtConfigurationProperties;

    public TenantService(JwtConfigurationProperties jwtConfigurationProperties) {
        this.jwtConfigurationProperties = jwtConfigurationProperties;
    }

    /**
     * Looking up the tenant is more secure than simply calculating the JWK Set endpoint on the
     * fly.  This lookup would act as a list of allowed tenants.  We'll just mock the implementation
     * here for demo purposes, but this would likely utilize a repository to interact with a data source
     * instead of taking in the uris via config.
     */
    public Optional<TenantDto> findByIssuerUri(String issuerUri) {
        var issuerUris = Arrays.stream(jwtConfigurationProperties.issuerUris());

        return Optional.ofNullable(issuerUri)
                .filter(uri -> issuerUris.anyMatch(uri::equals))
                .map(TenantDto::new);
    }
}
