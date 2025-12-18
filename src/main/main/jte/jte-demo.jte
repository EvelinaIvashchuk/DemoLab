@import com.example.powertaskmanagerweb.model.Task
@import java.util.List
@import java.util.Locale
@import java.util.Arrays
@import org.springframework.context.MessageSource

@param String pageTitle
@param String username
@param String email
@param Boolean isAdmin
@param Boolean isLoggedIn
@param List<Task> tasks
@param int[] numbers
@param String greeting
@param Integer currentYear
@param Locale locale
@param MessageSource messageSource

<%-- JTE Features Demo --%>

@template.layout.main(
    pageTitle = pageTitle,
    locale = locale.toString(),
    username = username,
    isAdmin = isAdmin,
    messageSource = messageSource,
    currentLocale = locale
)
<div class="card mb-4">
    <div class="card-header">
        <h2>JTE Демо</h2>
    </div>
    <div class="card-body">
        <%-- Displaying data demonstration --%>
        <section id="displaying-data" class="mb-4">
            <h3>a. Відображення даних</h3>
            <p>Привітальне повідомлення: ${greeting}, ${username}!</p>
            <p>Email: ${email}</p>
            <p>Поточний рік: ${currentYear}</p>
        </section>

        <%-- If statements demonstration --%>
        <section id="if-statements" class="mb-4">
            <h3>b. If Оператор</h3>
            @if(isAdmin)
                <div class="alert alert-info">
                    <strong>Повідомлення для адміністратора:</strong> Ви маєте права адміністратора.
                </div>
            @elseif(isLoggedIn)
                <div class="alert alert-success">
                    <strong>Повідомлення для користувача:</strong> Ви увійшли як звичайний користувач.
                </div>
            @else
                <div class="alert alert-warning">
                    <strong>Повідомлення для гостя:</strong> Ви не увійшли в систему.
                </div>
            @endif
        </section>

        <%-- Loops demonstration --%>
        <section id="loops" class="mb-4">
            <h3>c. Цикли</h3>
            <h4>List:</h4>
            <ol>
                @for(String feature : Arrays.asList(
                        "Displaying data",
                        "If Statements",
                        "Loops",
                        "Comments",
                        "Template Calls",
                        "Named parameters",
                        "Default parameters",
                        "Varargs",
                        "Content",
                        "Variables"
                    ))
                    <li>${feature}</li>
                @endfor
            </ol>

            <h4>Масив чисел:</h4>
            <div class="d-flex">
                @for(int number : numbers)
                    <div class="p-2 bg-light m-1">${number}</div>
                @endfor
            </div>

            <h4>Завдання:</h4>
            @if(tasks.isEmpty())
                <p>Немає доступних завдань</p>
            @else
                <ul class="list-group">
                    @for(Task task : tasks)
                        <li class="list-group-item">
                            <h5>${task.getTitle()}</h5>
                            <p>Статус: ${task.getStatus()}</p>
                        </li>
                    @endfor
                </ul>
            @endif
        </section>

        <%-- Template calls demonstration --%>
        <section id="template-calls" class="mb-4">
            <h3>e. Виклик шаблонів</h3>
            <p>Наступна картка відображається за допомогою виклику шаблону з іменованими та параметрами за замовчуванням:</p>

            @template.components.user_info(
            username = username,
            email = email,
            isAdmin = isAdmin,
            roles = new String[]{"User", "Editor", "Viewer"}
            )
        </section>

        <%-- Content demonstration --%>
        <section id="content" class="mb-4">
            <h3>i. Контент</h3>
            <p>Вся ця сторінка обгорнута в блок контенту, який передається до головного шаблону макета.</p>
            <p>Головний шаблон макета використовує цей контент для відображення тіла сторінки, забезпечуючи при цьому єдиний заголовок і підвал.</p>
        </section>

        <%-- Variables demonstration --%>
        <section id="variables" class="mb-4">
            <h3>j. Змінні</h3>
            <p>Привітальне повідомлення «${greeting}, ${username}!» створене за допомогою змінних безпосередньо в розмітці.</p>
            <p>Список функцій також створено безпосередньо в коді без використання блоків Java.</p>
        </section>
    </div>
</div>
