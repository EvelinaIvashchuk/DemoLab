package com.example;

import io.smallrye.jwt.build.Jwt;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.time.Duration;

/**
 * Dev-only helper to mint a JWT compatible with the app's dev security settings.
 * Available only when built in the `dev` profile via @IfBuildProfile.
 */
@io.quarkus.arc.profile.IfBuildProfile("dev")
@Path("/dev")
public class DevTokenResource {

    /**
     * Returns a signed HS256 JWT using the dev secret configured in application.properties.
     * Claims are aligned with the app's verification settings (issuer, audience, subject).
     */
    @GET
    @Path("/token")
    @Produces(MediaType.TEXT_PLAIN)
    public String token() {
        // Default demo user
        String username = "alice";
        return Jwt.issuer("http://localhost/dev-issuer")
                .subject(username)
                .upn(username)
                .audience("backend-service")
                .claim("preferred_username", username)
                .expiresIn(Duration.ofHours(1))
                .sign();
    }
}
