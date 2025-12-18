
@import com.example.powertaskmanagerweb.model.Task
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param Task task
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
        <form action="${task.getId() != null ? "/tasks/" + task.getId() : "/tasks"}" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="title" class="form-label">${messageSource.getMessage("task.title", null, locale)}</label>
                <input type="text" class="form-control" id="title" name="title" value="${task.getTitle() != null ? task.getTitle() : ""}" required>
                <div class="invalid-feedback">
                    ${messageSource.getMessage("task.title", null, locale)} ${messageSource.getMessage("message.error.required", null, locale)}
                </div>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">${messageSource.getMessage("task.description", null, locale)}</label>
                <textarea class="form-control" id="description" name="description" rows="3">${task.getDescription() != null ? task.getDescription() : ""}</textarea>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">${messageSource.getMessage("task.status", null, locale)}</label>
                <select class="form-select" id="status" name="status" required>
                    @if(task.getStatus() != null && task.getStatus().equals("TODO"))
                        <option value="TODO" selected>
                            ${messageSource.getMessage("task.status.todo", null, locale)}
                        </option>
                    @else
                        <option value="TODO">
                            ${messageSource.getMessage("task.status.todo", null, locale)}
                        </option>
                    @endif

                    @if(task.getStatus() != null && task.getStatus().equals("IN_PROGRESS"))
                        <option value="IN_PROGRESS" selected>
                            ${messageSource.getMessage("task.status.in_progress", null, locale)}
                        </option>
                    @else
                        <option value="IN_PROGRESS">
                            ${messageSource.getMessage("task.status.in_progress", null, locale)}
                        </option>
                    @endif

                    @if(task.getStatus() != null && task.getStatus().equals("DONE"))
                        <option value="DONE" selected>
                            ${messageSource.getMessage("task.status.done", null, locale)}
                        </option>
                    @else
                        <option value="DONE">
                            ${messageSource.getMessage("task.status.done", null, locale)}
                        </option>
                    @endif
                </select>
            </div>

            <div class="mb-3">
                <label for="priority" class="form-label">${messageSource.getMessage("task.priority", null, locale)}</label>
                <input type="number" class="form-control" id="priority" name="priority" value="${task.getPriority() != null ? task.getPriority() : 0}" min="0" max="10">
            </div>

            <div class="mb-3">
                <label for="dueDate" class="form-label">${messageSource.getMessage("task.dueDate", null, locale)}</label>
                <input type="datetime-local" class="form-control" id="dueDate" name="dueDate" value="${task.getDueDate() != null ? task.getDueDate().toString().substring(0, 16) : ""}">
            </div>

            <div class="d-flex justify-content-between">
                <a href="/tasks" class="btn btn-secondary">${messageSource.getMessage("button.cancel", null, locale)}</a>
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