@import com.example.powertaskmanagerweb.model.User
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param User user
@param Locale locale
@param MessageSource messageSource

@template.layout.main(
pageTitle = pageTitle,
locale = locale.toString(),
username = null,
isAdmin = false,
messageSource = messageSource,
currentLocale = locale
)
<div class="row">
    <div class="col-md-8 offset-md-2">
        <form action="${user.getId() != null ? "/users/" + user.getId() : "/users"}" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="username" class="form-label">${messageSource.getMessage("user.username", null, locale)}</label>
                <input type="text" class="form-control" id="username" name="username" value="${user.getUsername() != null ? user.getUsername() : ""}" required>
                <div class="invalid-feedback">
                    ${messageSource.getMessage("user.username", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">${messageSource.getMessage("user.email", null, locale)}</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.getEmail() != null ? user.getEmail() : ""}" required>
                <div class="invalid-feedback">
                    ${messageSource.getMessage("user.email", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
            </div>

            <div class="mb-3">
                <label for="passwordHash" class="form-label">${messageSource.getMessage("user.password", null, locale)}</label>
                @if(user.getId() == null)
                    <input type="password" class="form-control" id="passwordHash" name="passwordHash" required>
                @else
                    <input type="password" class="form-control" id="passwordHash" name="passwordHash">
                @endif
                <div class="invalid-feedback">
                    ${messageSource.getMessage("user.password", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
                @if(user.getId() != null)
                    <small class="form-text text-muted">Залиште порожнім, щоб залишити поточний пароль.</small>
                @endif
            </div>

            <div class="d-flex justify-content-between">
                <a href="/users" class="btn btn-secondary">${messageSource.getMessage("button.cancel", null, locale)}</a>
                <button type="submit" class="btn btn-primary">${messageSource.getMessage("button.save", null, locale)}</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Form validation
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>