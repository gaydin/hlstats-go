<div class="my-3 p-3 bg-white rounded shadow-sm">
    <ul class="nav flex-column">
        General Settings
        <li class="nav-item">
            <a class="nav-link active" href="/admin/">Hlstats Settings</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/users">Admin Users</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/games">Games</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/hostgroups">Host Groups</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/clantags">Clan Tag Patterns</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/voicecomm">Manage Voice Servers</a>
        </li>
        Game Settings
        {{ range .  }}
            <a href="/game/{{ .Code }}/"><img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}</a>
            Add Server <br>
            Edit Servers <br>
            Actions <br>
            Teams <br>
            Roles <br>
            Weapons <br>
            Weapon Awards <br>
            Plyr Action Awards <br>
            PlyrPlyr Action Awards <br>
            PlyrPlyr Action Awards (Victim) <br>
            Ranks (triggered by Kills) <br>
            Ribbons (triggered by Awards) <br>
        {{ end }}
    </ul>
</div>