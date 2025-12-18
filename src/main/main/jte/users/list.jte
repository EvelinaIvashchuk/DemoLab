@import com.example.powertaskmanagerweb.model.User
@import java.util.List
@import java.util.Locale
@import org.springframework.context.MessageSource

@param String pageTitle
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
    <div class="row mb-4">
        <div class="col-md-6">
            <h2>${messageSource.getMessage("user.list", null, locale)}</h2>
        </div>
        <div class="col-md-6 text-end">
            <a href="/users/new" class="btn btn-success">
                ${messageSource.getMessage("user.new", null, locale)}
            </a>
        </div>
    </div>

    @if(users.isEmpty())
        <div class="alert alert-info">
            No users found.
        </div>
    @else
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>${messageSource.getMessage("user.username", null, locale)}</th>
                        <th>${messageSource.getMessage("user.email", null, locale)}</th>
                        <th>${messageSource.getMessage("user.createdAt", null, locale)}</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @for(User user : users)
                        <tr>
                            <td>${user.getUsername()}</td>
                            <td>${user.getEmail()}</td>
                            <td>${user.getCreatedAt() != null ? user.getCreatedAt().toString() : "N/A"}</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group">
                                    <a href="/users/${user.getId()}" class="btn btn-outline-primary">
                                        ${messageSource.getMessage("button.view", null, locale)}
                                    </a>
                                    <a href="/users/${user.getId()}/edit" class="btn btn-outline-secondary">
                                        ${messageSource.getMessage("button.edit", null, locale)}
                                    </a>
                                    <a href="/users/${user.getId()}/delete" class="btn btn-outline-danger" 
                                       onclick="return confirm('${messageSource.getMessage("message.confirm.delete", new Object[]{user.getUsername()}, locale)}')">
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