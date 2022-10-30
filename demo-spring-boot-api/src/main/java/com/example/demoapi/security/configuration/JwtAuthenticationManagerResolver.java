package com.example.demoapi.security.configuration;

import com.example.demoapi.security.tenants.TenantService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationManagerResolver;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.jwt.JwtDecoders;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationProvider;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class JwtAuthenticationManagerResolver implements AuthenticationManagerResolver<String> {

    private final JwtAuthenticationConverter jwtAuthenticationConverter;
    private final TenantService tenantService;

    private Map<String, AuthenticationManager> authenticationManagers = new ConcurrentHashMap<>();

    public JwtAuthenticationManagerResolver(
            JwtAuthenticationConverter jwtAuthenticationConverter,
            TenantService tenantService
    ) {
        this.jwtAuthenticationConverter = jwtAuthenticationConverter;
        this.tenantService = tenantService;
    }

    @Override
    public AuthenticationManager resolve(String issuer) {
        if (!authenticationManagers.containsKey(issuer) && tenantService.findByIssuerUri(issuer).isPresent()) {
            authenticationManagers.put(issuer, createAuthenticationManager(issuer));
        }

        return authenticationManagers.getOrDefault(issuer, this::invalidIssuerAuthentication);
    }

    private AuthenticationManager createAuthenticationManager(String issuer) {
        var authenticationProvider = new JwtAuthenticationProvider(JwtDecoders.fromOidcIssuerLocation(issuer));
        authenticationProvider.setJwtAuthenticationConverter(jwtAuthenticationConverter);

        return authenticationProvider::authenticate;
    }

    private Authentication invalidIssuerAuthentication(Authentication authentication) throws AuthenticationException {
        throw new InsufficientAuthenticationException("Invalid JWT issuer");
    }
}
