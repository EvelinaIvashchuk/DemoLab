@import com.example.powertaskmanagerweb.model.Task
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param List<Task> tasks
@param Locale locale
@param MessageSource messageSource
@param String currentStatus = null
@param Integer currentPriority = null

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
            <div class="btn-group" role="group">
                <a href="/tasks" class="btn btn-outline-primary ${currentStatus == null && currentPriority == null ? "active" : ""}">
                    ${messageSource.getMessage("task.list", null, locale)}
                </a>
                <a href="/tasks/status/TODO" class="btn btn-outline-warning ${currentStatus != null && currentStatus.equals("TODO") ? "active" : ""}">
                    ${messageSource.getMessage("task.status.todo", null, locale)}
                </a>
                <a href="/tasks/status/IN_PROGRESS" class="btn btn-outline-info ${currentStatus != null && currentStatus.equals("IN_PROGRESS") ? "active" : ""}">
                    ${messageSource.getMessage("task.status.in_progress", null, locale)}
                </a>
                <a href="/tasks/status/DONE" class="btn btn-outline-success ${currentStatus != null && currentStatus.equals("DONE") ? "active" : ""}">
                    ${messageSource.getMessage("task.status.done", null, locale)}
                </a>
            </div>
        </div>
        <div class="col-md-6 text-end">
            <a href="/tasks/new" class="btn btn-success">
                ${messageSource.getMessage("task.new", null, locale)}
            </a>
        </div>
    </div>

    @if(tasks.isEmpty())
        <div class="alert alert-info">
            No tasks found.
        </div>
    @else
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>${messageSource.getMessage("task.title", null, locale)}</th>
                        <th>${messageSource.getMessage("task.status", null, locale)}</th>
                        <th>${messageSource.getMessage("task.priority", null, locale)}</th>
                        <th>${messageSource.getMessage("task.dueDate", null, locale)}</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @for(Task task : tasks)
                        <tr>
                            <td>${task.getTitle()}</td>
                            <td>
                                <span class="badge bg-${task.getStatus().equals("TODO") ? "warning" : (task.getStatus().equals("IN_PROGRESS") ? "info" : "success")}">
                                    ${task.getStatus()}
                                </span>
                            </td>
                            <td>${task.getPriority()}</td>
                            <td>${task.getDueDate() != null ? task.getDueDate().toString() : "N/A"}</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group">
                                    <a href="/tasks/${task.getId()}" class="btn btn-outline-primary">
                                        ${messageSource.getMessage("button.view", null, locale)}
                                    </a>
                                    <a href="/tasks/${task.getId()}/edit" class="btn btn-outline-secondary">
                                        ${messageSource.getMessage("button.edit", null, locale)}
                                    </a>
                                    <a href="/tasks/${task.getId()}/delete" class="btn btn-outline-danger" 
                                       onclick="return confirm('Ви впевнені, що хочете видалити це завдання?')">
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
