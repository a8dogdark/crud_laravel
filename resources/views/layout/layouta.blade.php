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
    <input type="checkbox" id="sidebar-toogle">
    <div class="sidebar__admin">
        <div class="sidebar__admin__header">
            <h3>
                <span class="bx bx-unlink"></span>
                <span>DOGDARK</span>
            </h3>
            <label for="sidebar-toogle" class="bx bx-menu"></label>
        </div>

        <div class="sidebar__admin__menu">
            <ul>
                <li>
                    <a href="#" title="Pagina de inicio">
                        <span class="bx bxs-home"></span>
                        <span>Home</span>
                    </a>
                </li>

                <li>
                    <a href="#" title="Artículos">
                        <span class="bx bxs-bookmarks"></span>
                        <span>Artículos</span>
                    </a>
                </li>

                <li>
                    <a href="#" title="Categorías">
                        <span class="bx bx-category"></span>
                        <span>Categorías</span>
                    </a>
                </li>

                <li>
                    <a href="#" title="Comentarios">
                        <span class="bx bxs-chat"></span>
                        <span>Comentarios</span>
                    </a>
                </li>

                <li>
                    <a href="#" title="Usuarios">
                        <span class="bx bxs-user"></span>
                        <span>Usuarios</span>
                    </a>
                </li>

                <li>
                    <a href="#" title="Roles">
                        <span class="bx bxs-universal-access"></span>
                        <span>Roles</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-admin">
        <header class="main-admin-header">
            <div class="search-admin">
                <span class="bx bx-search"></span>
                <input type="search" placeholder="Search">
            </div>
        </header>

        <main>
            <div>
                @yield('contentadmin')
            </div>
        </main>
    </div>
    
    
</body>
</html>