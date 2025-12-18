@import java.util.List
@import java.util.ArrayList

@param String username
@param String email = "default@gmail.com"
@param List<String> roles = null
@param Boolean showEmail = true

<%-- Process roles to ensure we have a non-null list --%>
!{
    List<String> userRoles = roles;
    if (userRoles == null) {
        userRoles = new ArrayList<>();
        userRoles.add("User");
    }
}

<div class="card mb-3">
    <div class="card-header">
        <h4>Інформація про користувача</h4>
    </div>
    <div class="card-body">
        <h5 class="card-title">${username}</h5>

        @if(showEmail)
            <p class="card-text">Email: ${email}</p>
        @endif

        <p class="card-text">Ролі:</p>
        <ul>
            @for(String role : roles != null ? roles : java.util.List.of("User"))
                <li>${role}</li>
            @endfor
        </ul>
    </div>
</div>
