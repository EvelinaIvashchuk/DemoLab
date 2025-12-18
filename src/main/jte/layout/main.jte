@param String pageTitle = "Менеджер Завдань"
@param String locale = "uk"
@param String username = null
@param Boolean isAdmin = false
@param String successMessage = null
@param String errorMessage = null
@param gg.jte.Content content = null
@param org.springframework.context.MessageSource messageSource
@param java.util.Locale currentLocale

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/">${messageSource.getMessage("app.name", null, currentLocale)}</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">${messageSource.getMessage("nav.home", null, currentLocale)}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tasks">${messageSource.getMessage("nav.tasks", null, currentLocale)}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users">${messageSource.getMessage("nav.users", null, currentLocale)}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/assignments">${messageSource.getMessage("nav.assignments", null, currentLocale)}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/jte-demo">${messageSource.getMessage("nav.jte-demo", null, currentLocale)}</a>
                    </li>
                </ul>

                @if(username != null)
                    <span class="navbar-text me-3">
                        ${messageSource.getMessage("user.welcome", new Object[]{username}, currentLocale)}
                        @if(isAdmin)
                            <span class="badge bg-danger">${messageSource.getMessage("user.admin", null, currentLocale)}</span>
                        @endif
                    </span>
                @endif

            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Success and error messages -->
        @if(successMessage != null)
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if(errorMessage != null)
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <!-- Page title -->
        <h1 class="mb-4">${pageTitle}</h1>

        <!-- Main content -->
        <main>
            ${content}
        </main>
    </div>

    <!-- Footer -->
    <footer class="bg-light text-center text-muted py-3 mt-5">
        <div class="container">
            <p>${messageSource.getMessage("app.footer", new Object[]{java.time.Year.now().getValue()}, currentLocale)}</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
