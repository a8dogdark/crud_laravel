<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('titleadmin')</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    @vite(['resources/css/app.css'])
</head>
<body>
    <div class="sidebar__admin">
        <div class="logo__details">
            <i class='bx bxl-c-plus-plus'></i>
            <span class="logo__name">DOGDARK</span>
        </div>
        <ul class="nav__links">
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt'></i>
                    <span class="link__name">Panel de Control</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-bookmarks'></i>
                    <span class="link__name">Artículos</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-category'></i>
                    <span class="link__name">Categorías</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-message-alt-detail'></i>
                    <span class="link__name">Comentarios</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxs-user-account'></i>
                    <span class="link__name">Usuarios</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-objects-vertical-center'></i>
                    <span class="link__name">Roles</span>
                </a>
            </li>
        </ul>
    </div>

    <section class="section__home">
        <nav>
            <div class="sidebar__button">
                <i class='bx bx-menu'></i>
                <span class="sidebar__dashboard">Dashboard</span>
            </div>

            <div class="sidebar__profile__details">
                <i class='bx bxs-user-circle'></i>
                <span class="sidebar__admin__name">Admin Name</span>
                <i class='bx bxs-chevron-down'></i>
            </div>
        </nav>
    </section>

    @yield('contentadmin')
</body>
</html>