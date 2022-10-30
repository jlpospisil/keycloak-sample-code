package com.example.demoapi.security.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.server.resource.authentication.JwtIssuerAuthenticationManagerResolver;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
public class WebSecurityConfiguration {

    private final JwtAuthenticationManagerResolver authenticationManagerResolver;

    public WebSecurityConfiguration(JwtAuthenticationManagerResolver authenticationManagerResolver) {
        this.authenticationManagerResolver = authenticationManagerResolver;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .anyRequest().authenticated()
                )
                .cors(withDefaults())
                .oauth2ResourceServer(oauth2 -> oauth2
                        .authenticationManagerResolver(new JwtIssuerAuthenticationManagerResolver(authenticationManagerResolver))
                );
        return http.build();
    }
}
