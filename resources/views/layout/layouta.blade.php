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
    <section class="sidebar__menu">
        <nav>
            <ul>
                <li>
                    <a href="{{ route('home') }}" class="sidebar__menu_link" title="Sitio Principal">
                        <i class='bx bx-sitemap'></i>
                        <span class="sidebar__menu__title">DOGDARK</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('aprincipal') }}" class="sidebar__menu_link" title="Configuración del Sitio">
                        <i class='bx bxs-wrench'></i>
                        <span class="sidebar__menu__title">Configuración</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('aarticulos') }}" class="sidebar__menu_link" title="Artículos Publicados">
                        <i class='bx bxs-bookmarks'></i>
                        <span class="sidebar__menu__title">Artículos</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('acategorias') }}" class="sidebar__menu_link" title="Categorías">
                        <i class='bx bxs-category'></i>
                        <span class="sidebar__menu__title">Categorías</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('acomentarios') }}" class="sidebar__menu_link" title="Comentarios">
                        <i class='bx bxs-message-alt-detail'></i>
                        <span class="sidebar__menu__title">Comentarios</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('ausuarios') }}" class="sidebar__menu_link" title="Usuarios Registrados">
                        <i class='bx bxs-user'></i>
                        <span class="sidebar__menu__title">Usuarios</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('aroles') }}" class="sidebar__menu_link" title="Roles de Usuarios">
                        <i class='bx bxs-user-detail'></i>
                        <span class="sidebar__menu__title">Roles</span>
                    </a>
                </li>
            </ul>
        </nav>
    </section>

    <section class="sidebar__contenido">
        <div class="sidebar__contenido__title">
            DASHBOARD
        </div>
        <div class="sidebar__contenido__body">
            @yield('contentadmin')
        </div>
        
    </section>
</body>
</html>