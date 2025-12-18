@import com.example.powertaskmanagerweb.model.Task
@import java.util.Locale
@import org.springframework.context.MessageSource
@import java.time.format.DateTimeFormatter
@import java.time.format.FormatStyle

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
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">${task.getTitle()}</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <h6>${messageSource.getMessage("task.description", null, locale)}</h6>
                        <p>${task.getDescription() != null && !task.getDescription().isEmpty() ? task.getDescription() : "N/A"}</p>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <h6>${messageSource.getMessage("task.status", null, locale)}</h6>
                            <span class="badge bg-${task.getStatus().equals("TODO") ? "warning" : (task.getStatus().equals("IN_PROGRESS") ? "info" : "success")}">
                                ${task.getStatus().equals("TODO") ? messageSource.getMessage("task.status.todo", null, locale) : 
                                  (task.getStatus().equals("IN_PROGRESS") ? messageSource.getMessage("task.status.in_progress", null, locale) : 
                                   messageSource.getMessage("task.status.done", null, locale))}
                            </span>
                        </div>
                        
                        <div class="col-md-4">
                            <h6>${messageSource.getMessage("task.priority", null, locale)}</h6>
                            <p>${task.getPriority()}</p>
                        </div>
                        
                        <div class="col-md-4">
                            <h6>${messageSource.getMessage("task.dueDate", null, locale)}</h6>
                            <p>${task.getDueDate() != null ? task.getDueDate().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)) : "N/A"}</p>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h6>${messageSource.getMessage("task.createdAt", null, locale)}</h6>
                            <p>${task.getCreatedAt() != null ? task.getCreatedAt().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)) : "N/A"}</p>
                        </div>
                        
                        <div class="col-md-6">
                            <h6>${messageSource.getMessage("task.updatedAt", null, locale)}</h6>
                            <p>${task.getUpdatedAt() != null ? task.getUpdatedAt().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)) : "N/A"}</p>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <a href="/tasks" class="btn btn-secondary">${messageSource.getMessage("button.back", null, locale)}</a>
                        <div>
                            <a href="/tasks/${task.getId()}/edit" class="btn btn-primary">${messageSource.getMessage("button.edit", null, locale)}</a>
                            <a href="/tasks/${task.getId()}/delete" class="btn btn-danger" 
                               onclick="return confirm('${messageSource.getMessage("message.confirm.delete", new Object[]{task.getTitle()}, locale)}')">
                                ${messageSource.getMessage("button.delete", null, locale)}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>