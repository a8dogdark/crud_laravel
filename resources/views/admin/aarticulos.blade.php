@extends('layout.layouta')
@section('titleadmin','Artículos Publicados')
@section('contentadmin')
    <div class="mbot-1">
        <h2>Artículos</h2>
    </div>
    <div>
        <table class="table mbot-1">
            <tr>
                <th>ID</th>
                <th>TITLE</th>
                <th>ACCION</th>
            </tr>

            @for ($i=0;$i<5;$i++)
                <tr>
                    <td>00</td>
                    <td>NUEVO ARTICULO</td>
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