package com.example.apiclient;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/api")
public class ForwardController {

    private final SecureHelloService secureHelloService;

    public ForwardController(SecureHelloService secureHelloService) {
        this.secureHelloService = secureHelloService;
    }

    @GetMapping("/forward")
    public Mono<String> forwardHello() {
        return secureHelloService.fetchHello();
    }
}
