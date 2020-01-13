<div class="my-3 p-3 bg-white rounded shadow-sm">
    <ul class="list-unstyled">
        <h5>General Settings</h5>
        <li>
            <a class="nav-link text-muted  active" href="/admin/">Hlstats Settings</a>
        </li>
        <li>
            <a class="nav-link text-muted" href="/admin/users">Admin Users</a>
        </li>
        <li>
            <a class="nav-link text-muted" href="/admin/games">Games</a>
        </li>
        <h5>Game Settings</h5>
        {{ range .  }}
            <a class="text-muted" href="/admin/game/{{ .Code }}/">
                    <img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}
                </a>
            <ul class="list-unstyled">
                <li><a class="nav-link text-muted" href="/admin/game/{{ .Code }}/newserver">Add Server</a></li>
                <li><a class="nav-link text-muted" href="/admin/game/{{ .Code }}/servers">Edit Servers</a></li>
            </ul>
            </li>
        {{ end }}
    </ul>
</div>