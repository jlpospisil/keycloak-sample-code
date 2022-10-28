package com.example.demoapi.security;

import org.springframework.web.bind.annotation.CrossOrigin;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
@CrossOrigin(originPatterns = "${api.cors.origin-patterns}", allowedHeaders = "*", allowCredentials = "true")
public @interface AllowCrossOrigin {
}
