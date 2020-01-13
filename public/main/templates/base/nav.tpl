<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <a class="" href="/"><img src="/public/hlstatsimg/icons/sourcebans/title.png"
                              alt="HLstatsX Community Edition" title="HLstatsX Community Edition"></a>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            {{ if .user }}
                <ul>
                    <form id="logout" method="post" action="/admin/logout">
                        <a href="#" class="btn btn-outline-danger"
                           onclick="document.getElementById('logout').submit();">
                            Logout
                        </a>
                    </form>
                </ul>
            {{ end }}
        </ul>
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