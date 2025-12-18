@import com.example.powertaskmanagerweb.model.User
@import com.example.powertaskmanagerweb.model.TaskAssignment
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

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
    <div class="row mb-4">
        <div class="col-md-8">
            <h2>${messageSource.getMessage("assignment.forUser", null, locale)}: ${user.getUsername()}</h2>
            <p class="text-muted">${user.getEmail()}</p>
        </div>
        <div class="col-md-4 text-end">
            <a href="/users/${user.getId()}" class="btn btn-outline-primary me-2">
                ${messageSource.getMessage("button.backToUser", null, locale)}
            </a>
            <a href="/assignments/new" class="btn btn-success">
                ${messageSource.getMessage("assignment.new", null, locale)}
            </a>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-header">
            ${messageSource.getMessage("user.details", null, locale)}
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("user.username", null, locale)}:</strong> ${user.getUsername()}</p>
                </div>
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("user.email", null, locale)}:</strong> ${user.getEmail()}</p>
                </div>
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("user.createdAt", null, locale)}:</strong> ${user.getCreatedAt() != null ? user.getCreatedAt().toString() : "N/A"}</p>
                </div>
            </div>
        </div>
    </div>

    <h3>${messageSource.getMessage("assignment.list", null, locale)}</h3>

    @if(assignments.isEmpty())
        <div class="alert alert-info">
            ${messageSource.getMessage("assignment.noneForUser", null, locale)}
        </div>
    @else
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>${messageSource.getMessage("assignment.task", null, locale)}</th>
                        <th>${messageSource.getMessage("task.status", null, locale)}</th>
                        <th>${messageSource.getMessage("task.priority", null, locale)}</th>
                        <th>${messageSource.getMessage("assignment.assignedAt", null, locale)}</th>
                        <th>${messageSource.getMessage("assignment.actions", null, locale)}</th>
                    </tr>
                </thead>
                <tbody>
                    @for(TaskAssignment assignment : assignments)
                        <tr>
                            <td>
                                <a href="/tasks/${assignment.getTask().getId()}">
                                    ${assignment.getTask().getTitle()}
                                </a>
                            </td>
                            <td>
                                <span class="badge bg-${assignment.getTask().getStatus().equals("TODO") ? "warning" : (assignment.getTask().getStatus().equals("IN_PROGRESS") ? "info" : "success")}">
                                    ${assignment.getTask().getStatus()}
                                </span>
                            </td>
                            <td>${assignment.getTask().getPriority()}</td>
                            <td>${assignment.getAssignedAt() != null ? assignment.getAssignedAt().toString() : "N/A"}</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group">
                                    <a href="/assignments/${assignment.getId()}/delete" class="btn btn-outline-danger" 
                                       onclick="return confirm('${messageSource.getMessage("message.confirm.delete.assignment", null, locale)}')">
                                        ${messageSource.getMessage("button.delete", null, locale)}
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endfor
                </tbody>
            </table>
        </div>
    @endif