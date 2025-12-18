@import com.example.powertaskmanagerweb.model.TaskAssignment
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
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
        <div class="col-md-6">
            <h2>${messageSource.getMessage("assignment.list", null, locale)}</h2>
        </div>
        <div class="col-md-6 text-end">
            <a href="/assignments/new" class="btn btn-success">
                ${messageSource.getMessage("assignment.new", null, locale)}
            </a>
        </div>
    </div>

    @if(assignments.isEmpty())
        <div class="alert alert-info">
            ${messageSource.getMessage("assignment.none", null, locale)}
        </div>
    @else
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>${messageSource.getMessage("assignment.task", null, locale)}</th>
                        <th>${messageSource.getMessage("assignment.user", null, locale)}</th>
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