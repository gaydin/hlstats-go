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
        <li>
            <a class="nav-link text-muted" href="/admin/hostgroups">Host Groups</a>
        </li>
        <li>
            <a class="nav-link text-muted" href="/admin/clantags">Clan Tag Patterns</a>
        </li>
        <li>
            <a class="nav-link text-muted" href="/admin/voicecomm">Manage Voice Servers</a>
        </li>

        <h5>Game Settings</h5>
        {{ range .  }}


                <a class="text-muted" href="/admin/game/{{ .Code }}/">
                    <img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}
                </a>
            <ul class="list-unstyled">
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Add Server</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Edit Servers</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Actions</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Teams</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Roles</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}"> Weapons</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Weapon Awards</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Plyr Action Awards</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">PlyrPlyr Action Awards</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">PlyrPlyr Action Awards (Victim)</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Ranks (triggered by Kills)</a></li>
                <li><a class="nav-link text-muted" href="/admin/{{ .Code }}">Ribbons (triggered by Awards)</a></li>
            </ul>
            </li>
        {{ end }}
    </ul>
</div>