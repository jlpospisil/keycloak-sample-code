package com.example.demoapi;

import com.example.demoapi.security.CorsEnabled;
import com.example.demoapi.security.authorities.HasAuthorityDemoRead;
import com.example.demoapi.security.authorities.HasAuthorityDemoWrite;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@CorsEnabled
public class DemoController {

    @GetMapping("/demo-read")
    @HasAuthorityDemoRead
    public Map<String, Object> demoRead() {
        var jwt = getJwt();
        return Map.of(
                "demo-endpoint", "read access demo endpoint",
                "jwt issuer", jwt.getIssuer(),
                "username", jwt.getClaims().get("preferred_username")
        );
    }

    @GetMapping("/demo-write")
    @HasAuthorityDemoWrite
    public Map<String, Object> demoWrite() {
        var jwt = getJwt();
        return Map.of(
                "demo-endpoint", "write access demo endpoint",
                "jwt issuer", jwt.getIssuer(),
                "username", jwt.getClaims().get("preferred_username")
        );
    }

    @GetMapping("/user-info")
    public Authentication userIngo() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    private Jwt getJwt() {
        return (Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
