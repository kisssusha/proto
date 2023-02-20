<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="">
        ER
    </a>
    <button class="navbar-toggler" type="button"
            data-toggle="collapse"
            data-target="#navbarsExampleDefault"
            aria-controls="navbarsExampleDefault"
            aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon">

        </span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link " href="../error/list.cfm">
                    Список ошибок
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="../error/registration.cfm">
                    Добавить ошибки
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../error/update.cfm">
                    Редактировать пользователя
                    <span class="sr-only">
                        (current)
                    </span>
                </a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                Search
            </button>
            <a href="../main/main.cfm?logout">
                Logout
            </a>
        </form>
    </div>
</nav>
