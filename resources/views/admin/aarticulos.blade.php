@extends('layout.layouta')
@section('titleadmin','Artículos Publicados')
@section('contentadmin')
    <div class="mbot-1">
        <h2 class="fnt__mayu">Artículos <a href="{{ route('anarticulos') }}" class="btn__verde fnt__1">Nuevo</a></h2>
    </div>
    <div>
        <table class="table mbot-1">
            <tr class="bg__gris fnt__blanco fnt__bold">
                <th>ID</th>
                <th>TITLE</th>
                <th>ESTADO</th>
                <th>CATEGORIA</th>
                <th>ACCION</th>
            </tr>

            @for ($i=0;$i<5;$i++)
                <tr>
                    <td class="fnt__bold">00</td>
                    <td>NUEVO ARTICULO</td>
                    <td>PUBLICO</td>
                    <td>GENERAL</td>
                    <td>
                        <a href="#">
                            <i class='bx bxs-edit-alt btn__verde'></i>
                        </a> 
                        <a href="#">
                            <i class='bx bxs-trash btn__rojo'></i>
                        </a>
                    </td>
                </tr>
            @endfor
            
            
        </table>
    </div>
    <div class="pagination">
        <ul>
            @for ($a=0;$a<5;$a++)
                <li>
                    <a href="#">1</a>
                </li>    
            @endfor
            
        </ul>
    </div>
@endsection