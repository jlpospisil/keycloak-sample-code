package com.example.demoapi.security;

public class Roles {

    private Roles() {
        // prevent direct instantiation
    }

    public static final String PREFIX = "ROLE_";

    public static final String DEMO_READ = "demo.read";
    public static final String DEMO_WRITE = "demo.write";
}
