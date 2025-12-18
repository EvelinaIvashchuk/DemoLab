@param String username
@param String email = "default@example.com"
@param Boolean isAdmin = false
@param String... roles

<div class="card mb-3">
    <div class="card-header">
        <h4>Інформація про користувача</h4>
    </div>
    <div class="card-body">
        <h5 class="card-title">${username}</h5>
        <p class="card-text">Email: ${email}</p>
        
        @if(isAdmin)
            <p class="card-text"><span class="badge bg-danger">Адмін</span></p>
        @endif
        
        @if(roles != null && roles.length > 0)
            <p class="card-text">Ролі:</p>
            <ul>
                @for(String role : roles)
                    <li>${role}</li>
                @endfor
            </ul>
        @else
            <p class="card-text">Жодних конкретних ролей не призначено.</p>
        @endif
    </div>
</div>