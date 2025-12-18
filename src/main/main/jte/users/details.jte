@import com.example.powertaskmanagerweb.model.User
@import com.example.powertaskmanagerweb.model.TaskAssignment
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource
@import java.time.format.DateTimeFormatter
@import java.time.format.FormatStyle

@param String pageTitle
@param User user
@param List<TaskAssignment> assignments
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
                    <h5 class="card-title">${user.getUsername()}</h5>
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h6>${messageSource.getMessage("user.username", null, locale)}</h6>
                            <p>${user.getUsername()}</p>
                        </div>
                        
                        <div class="col-md-6">
                            <h6>${messageSource.getMessage("user.email", null, locale)}</h6>
                            <p>${user.getEmail()}</p>
                        </div>
                    </div>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h6>${messageSource.getMessage("user.createdAt", null, locale)}</h6>
                            <p>${user.getCreatedAt() != null ? user.getCreatedAt().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)) : "N/A"}</p>
                        </div>
                    </div>
                    
                    @if(!assignments.isEmpty())
                        <div class="mt-4">
                            <h6>Assigned Tasks</h6>
                            <div class="table-responsive">
                                <table class="table table-sm table-striped">
                                    <thead>
                                        <tr>
                                            <th>${messageSource.getMessage("task.title", null, locale)}</th>
                                            <th>${messageSource.getMessage("task.status", null, locale)}</th>
                                            <th>${messageSource.getMessage("assignment.assignedAt", null, locale)}</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @for(TaskAssignment assignment : assignments)
                                            <tr>
                                                <td>${assignment.getTask().getTitle()}</td>
                                                <td>
                                                    <span class="badge bg-${assignment.getTask().getStatus().equals("TODO") ? "warning" : (assignment.getTask().getStatus().equals("IN_PROGRESS") ? "info" : "success")}">
                                                        ${assignment.getTask().getStatus()}
                                                    </span>
                                                </td>
                                                <td>${assignment.getAssignedAt() != null ? assignment.getAssignedAt().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)) : "N/A"}</td>
                                                <td>
                                                    <a href="/tasks/${assignment.getTask().getId()}" class="btn btn-sm btn-outline-primary">
                                                        ${messageSource.getMessage("button.view", null, locale)}
                                                    </a>
                                                </td>
                                            </tr>
                                        @endfor
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endif
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <a href="/users" class="btn btn-secondary">${messageSource.getMessage("button.back", null, locale)}</a>
                        <div>
                            <a href="/users/${user.getId()}/edit" class="btn btn-primary">${messageSource.getMessage("button.edit", null, locale)}</a>
                            <a href="/users/${user.getId()}/delete" class="btn btn-danger" 
                               onclick="return confirm('${messageSource.getMessage("message.confirm.delete", new Object[]{user.getUsername()}, locale)}')">
                                ${messageSource.getMessage("button.delete", null, locale)}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>