package com.example;

import io.quarkus.security.Authenticated;
import io.quarkus.security.identity.SecurityIdentity;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

/**
 * POST endpoint protected with OIDC Bearer token.
 * Path: /secure/echo
 */
@Path("/secure")
@Authenticated // requires an authenticated identity (e.g., via Bearer token)
public class SecureResource {

    @Inject
    SecurityIdentity identity; // resolved when authenticated via OIDC Bearer token

    /**
     * Echoes back the provided payload and includes principal information taken from the Bearer token.
     */
    @POST
    @Path("/echo")
    @Consumes(MediaType.TEXT_PLAIN)
    @Produces(MediaType.TEXT_PLAIN)
    public String echo(String body) {
        String subject = identity != null && identity.getPrincipal() != null ? identity.getPrincipal().getName() : "anonymous";
        String payload = body == null ? "" : body;
        return "user=" + subject + "; received=" + payload;
    }
}
