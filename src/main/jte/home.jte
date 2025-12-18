@import com.example.powertaskmanagerweb.model.Task
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
@param List<Task> tasks
@param String username
@param Boolean isAdmin
@param Integer taskCount
@param Locale locale
@param MessageSource messageSource

<%-- This is a JTE comment that won't appear in the HTML output --%>

@template.layout.main(
    pageTitle = pageTitle,
    locale = locale.toString(),
    username = username,
    isAdmin = isAdmin,
    messageSource = messageSource,
    currentLocale = locale
)
    <div class="row">
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-header">
                    <h2>Ласкаво просимо до Power Task Manager</h2>
                </div>
                <div class="card-body">
                    <p class="lead">Це проста програма для управління завданнями, створена з використанням Spring Boot і шаблонів JTE.</p>

                    @if(isAdmin)
                        <div class="alert alert-info">
                            <strong>Повідомлення для адміністратора:</strong> У вас є права адміністратора.
                        </div>
                    @endif

                    <p>На даний момент у вас ${taskCount} завдань у системі.</p>

                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                        <a href="/tasks" class="btn btn-primary">Переглянути всі завдання</a>
                        <a href="/tasks/new" class="btn btn-success">Створити нове завдання</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h3>Останні завдання</h3>
                </div>
                <div class="card-body">
                    @if(tasks.isEmpty())
                        <p>Немає доступних завдань.</p>
                    @else
                        <ul class="list-group">
                            @for(Task task : tasks)
                                <li class="list-group-item">
                                    <h5>${task.getTitle()}</h5>
                                    <p class="mb-1">Статус: <span class="badge bg-${task.getStatus().equals("TODO") ? "warning" : (task.getStatus().equals("IN_PROGRESS") ? "info" : "success")}">${task.getStatus()}</span></p>
                                    <p class="mb-1">Пріоритет: ${task.getPriority()}</p>
                                    <a href="/tasks/${task.getId()}" class="btn btn-sm btn-outline-primary">Переглянути деталі</a>
                                </li>
                            @endfor
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    </div>
