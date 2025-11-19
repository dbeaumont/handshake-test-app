package com.example.apiclient;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.GeneralSecurityException;
import java.security.KeyStore;

import javax.net.ssl.TrustManagerFactory;

import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.netty.http.client.HttpClient;

@Configuration
public class WebClientConfiguration {

    @Bean
    public WebClient secureWebClient(DownstreamProperties properties)
            throws IOException, GeneralSecurityException {
        DownstreamProperties.TrustStore trustStore = properties.getTrustStore();
        Path trustStorePath = Path.of(trustStore.getPath());

        KeyStore keyStore = KeyStore.getInstance(trustStore.getType());
        try (InputStream inputStream = Files.newInputStream(trustStorePath)) {
            keyStore.load(inputStream, trustStore.getPassword().toCharArray());
        }

        TrustManagerFactory trustManagerFactory =
                TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        trustManagerFactory.init(keyStore);

        SslContext sslContext = SslContextBuilder.forClient()
                .trustManager(trustManagerFactory)
                .build();

        HttpClient httpClient = HttpClient.create()
                .secure(sslContextSpec -> sslContextSpec
                        .sslContext(sslContext));

        return WebClient.builder()
                .baseUrl(properties.getBaseUrl().toString())
                .clientConnector(new ReactorClientHttpConnector(httpClient))
                .build();
    }
}
