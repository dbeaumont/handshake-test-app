package com.example.apiclient;

import java.net.URI;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "downstream")
public class DownstreamProperties {

    private URI baseUrl = URI.create("https://api-server:8443/api/hello");
    private final TrustStore trustStore = new TrustStore();

    public URI getBaseUrl() {
        return baseUrl;
    }

    public void setBaseUrl(URI baseUrl) {
        this.baseUrl = baseUrl;
    }

    public TrustStore getTrustStore() {
        return trustStore;
    }

    public static class TrustStore {
        private String path = "/app/certs/client-truststore.p12";
        private String password = "changeit";
        private String type = "PKCS12";

        public String getPath() {
            return path;
        }

        public void setPath(String path) {
            this.path = path;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
    }
}
