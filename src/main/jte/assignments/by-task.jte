@import com.example.powertaskmanagerweb.model.Task
@import com.example.powertaskmanagerweb.model.TaskAssignment
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param Task task
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
            <h2>${messageSource.getMessage("assignment.forTask", null, locale)}: ${task.getTitle()}</h2>
            <p class="text-muted">${task.getDescription() != null ? task.getDescription() : ""}</p>
        </div>
        <div class="col-md-4 text-end">
            <a href="/tasks/${task.getId()}" class="btn btn-outline-primary me-2">
                ${messageSource.getMessage("button.backToTask", null, locale)}
            </a>
            <a href="/assignments/new" class="btn btn-success">
                ${messageSource.getMessage("assignment.new", null, locale)}
            </a>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-header">
            ${messageSource.getMessage("task.details", null, locale)}
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("task.status", null, locale)}:</strong> 
                        <span class="badge bg-${task.getStatus().equals("TODO") ? "warning" : (task.getStatus().equals("IN_PROGRESS") ? "info" : "success")}">
                            ${task.getStatus()}
                        </span>
                    </p>
                </div>
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("task.priority", null, locale)}:</strong> ${task.getPriority()}</p>
                </div>
                <div class="col-md-4">
                    <p><strong>${messageSource.getMessage("task.dueDate", null, locale)}:</strong> ${task.getDueDate() != null ? task.getDueDate().toString() : "N/A"}</p>
                </div>
            </div>
        </div>
    </div>

    <h3>${messageSource.getMessage("assignment.list", null, locale)}</h3>

    @if(assignments.isEmpty())
        <div class="alert alert-info">
            ${messageSource.getMessage("assignment.noneForTask", null, locale)}
        </div>
    @else
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>${messageSource.getMessage("assignment.user", null, locale)}</th>
                        <th>${messageSource.getMessage("assignment.assignedAt", null, locale)}</th>
                        <th>${messageSource.getMessage("assignment.actions", null, locale)}</th>
                    </tr>
                </thead>
                <tbody>
                    @for(TaskAssignment assignment : assignments)
                        <tr>
                            <td>
                                <a href="/users/${assignment.getUser().getId()}">
                                    ${assignment.getUser().getUsername()}
                                </a>
                            </td>
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