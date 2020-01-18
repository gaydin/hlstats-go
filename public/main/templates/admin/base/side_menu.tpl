{{ $current_game := .game }}
{{ $root := . }}
<div class="sidebar-sticky">
    <ul class="list-unstyled components">
        <h5>General Settings</h5>
        <li{{ if .IsIndex}} class="active"{{end}}>
            <a class="nav-link" href="/admin/"><i class="fas fa-cogs"></i>Hlstats Settings</a>
        </li>
        <li{{ if .IsUsers}} class="active"{{end}}>
            <a class="nav-link" href="/admin/users"><i class="fas fa-users"></i>Admin Users</a>
        </li>
        <li{{ if .IsGames}} class="active"{{end}}>
            <a class="nav-link" href="/admin/games"><i class="fas fa-gamepad"></i>Games</a>
        </li>
        <li{{ if .IsHostGroups}} class="active"{{end}}>
            <a class="nav-link" href="/admin/hostgroups"><i class="fas fa-bezier-curve"></i>Host Groups</a>
        </li>
        <li{{ if .IsClanTags}} class="active"{{end}}>
            <a class="nav-link" href="/admin/clantags"><i class="fas fa-object-group"></i>Clan Tag Patterns</a>
        </li>
        <li{{ if .IsVoiceServers}} class="active"{{end}}>
            <a class="nav-link" href="/admin/voicecomm"><i class="fab fa-teamspeak"></i>Manage Voice Servers</a>
        </li>
        <h5>Game Settings</h5>
        {{ range .menu_games  }}
            <li>
                <a href="#{{ .Code }}Submenu" data-toggle="collapse" aria-expanded="{{ if eq .Code $current_game }}true{{ else }}false{{ end }}" class="dropdown-toggle">
                    <img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/><span>{{ .Name }}</span>
                </a>
                <ul class="collapse list-unstyled{{ if eq .Code $current_game }} show{{ end }}" id="{{ .Code }}Submenu">
                    <li{{ if eq .Code $current_game }}{{ if $root.IsGameNewServer }} class="active"{{end}}{{end}}>
                        <a class="nav-link" href="/admin/game/{{ .Code }}/newserver">
                            <i class="fas fa-plus-circle"></i>Add Server</a>
                    </li>
                    <li{{ if eq .Code $current_game }}{{ if $root.IsGameServers }} class="active"{{end}}{{end}}>
                        <a class="nav-link" href="/admin/game/{{ .Code }}/servers">
                            <i class="fas fa-server"></i>Edit Servers</a>
                    </li>
                </ul>
            </li>
        {{ end }}
    </ul>

    <ul class="list-unstyled CTAs">
        <li>
            <a href="/"><i class="fas fa-long-arrow-alt-left"></i>Back to Public</a>
        </li>
    </ul>
</div>