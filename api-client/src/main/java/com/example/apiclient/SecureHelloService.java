package com.example.apiclient;

import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Service
public class SecureHelloService {

    private final WebClient webClient;

    public SecureHelloService(WebClient webClient) {
        this.webClient = webClient;
    }

    public Mono<String> fetchHello() {
        return webClient.get()
                .retrieve()
                .bodyToMono(String.class);
    }
}
