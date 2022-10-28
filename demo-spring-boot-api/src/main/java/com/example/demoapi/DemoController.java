package com.example.demoapi;

import com.example.demoapi.security.CorsEnabled;
import com.example.demoapi.security.authorities.HasAuthorityResource1Read;
import com.example.demoapi.security.authorities.HasAuthorityResource1Write;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@CorsEnabled
public class DemoController {

    @GetMapping("/demo-read")
    @HasAuthorityResource1Read
    public Map<String, Object> demoRead() {
        return Map.of("read-access", true);
    }

    @GetMapping("/demo-write")
    @HasAuthorityResource1Write
    public Map<String, Object> demoWrite() {
        return Map.of("write-access", true);
    }

    @GetMapping("/user-info")
    public Authentication userIngo() {
        return SecurityContextHolder.getContext().getAuthentication();
    }
}
