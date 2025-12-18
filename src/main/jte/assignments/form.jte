@import com.example.powertaskmanagerweb.model.Task
@import com.example.powertaskmanagerweb.model.User
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param List<Task> tasks
@param List<User> users
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
        <h2>${messageSource.getMessage("assignment.new", null, locale)}</h2>
        
        <form action="/assignments" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="taskId" class="form-label">${messageSource.getMessage("assignment.task", null, locale)}</label>
                <select class="form-select" id="taskId" name="taskId" required>
                    <option value="">${messageSource.getMessage("assignment.selectTask", null, locale)}</option>
                    @for(Task task : tasks)
                        <option value="${task.getId()}">${task.getTitle()}</option>
                    @endfor
                </select>
                <div class="invalid-feedback">
                    ${messageSource.getMessage("assignment.task", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
            </div>

            <div class="mb-3">
                <label for="userId" class="form-label">${messageSource.getMessage("assignment.user", null, locale)}</label>
                <select class="form-select" id="userId" name="userId" required>
                    <option value="">${messageSource.getMessage("assignment.selectUser", null, locale)}</option>
                    @for(User user : users)
                        <option value="${user.getId()}">${user.getUsername()}</option>
                    @endfor
                </select>
                <div class="invalid-feedback">
                    ${messageSource.getMessage("assignment.user", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
            </div>

            <div class="d-flex justify-content-between">
                <a href="/assignments" class="btn btn-secondary">${messageSource.getMessage("button.cancel", null, locale)}</a>
                <button type="submit" class="btn btn-primary">${messageSource.getMessage("button.assign", null, locale)}</button>
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