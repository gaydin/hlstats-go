<nav class="navbar navbar-expand-lg navbar-light bg-white rounded shadow-sm">
    <div class="container-fluid">

        <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Toggle Sidebar</span>
        </button>
        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-align-justify"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Page</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

{{ if ( .game ) and ne .game "" }}
    <nav class="navbar nav nav-underline navbar-expand-lg navbar-light bg-light rounded">
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
            <ul class="navbar-nav ">
                <li class="nav-item{{if .pageIsGame }} active{{end}}">
                    <a class="nav-link" href="/game/{{ .game }}/">Серверы</a>
                </li>
                <li class="nav-item{{if .pageIsPlayers }} active{{end}}">
                    <a class="nav-link" href="/game/{{ .game }}/players">Игроки</a>
                </li>
                <li class="nav-item{{if .pageIsActions }} active{{end}}">
                    <a class="nav-link" href="/game/{{ .game }}/actions">Действия</a>
                </li>
                <li class="nav-item{{if .pageIsWeapons }} active{{end}}">
                    <a class="nav-link" href="/game/{{ .game }}/weapons">Оружие</a>
                </li>
                <li class="nav-item{{if .pageIsMaps }} active{{end}}">
                    <a class="nav-link" href="/game/{{ .game }}/maps">Карты</a>
                </li>
            </ul>
        </div>
    </nav>
{{ end }}