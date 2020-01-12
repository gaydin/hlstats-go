{{ $topPlayers := .top_player_by_game }}
{{ template "base/head" . }}
<main role="main" class="container">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Game</th>
                <th scope="col">Players</th>
                <th scope="col">Top Player</th>
                <th scope="col">Top Clan</th>
            </tr>
            </thead>
            <tbody>
            {{ range .games }}
                <tr>
                    <td><a href="/game/{{ .Code }}/"><img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}</a></td>
                    <td><img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}</td>
                    <td>
                        {{ $topPlayer := index $topPlayers .Code}}
                        {{ if $topPlayer }}
                            <a href="/player/{{ $topPlayer.ID }}">{{ $topPlayer.LastName}}</a>
                        {{ end }}
                    </td>
                    <td><img src="/public/hlstatsimg/games/{{ .Code }}/game.png" alt="css"/>{{ .Name }}</td>
                </tr>

            {{end}}
            </tbody>
        </table>
        <small class="d-block text-right mt-3">
            <a href="#">All updates</a>
        </small>
    </div>
</main>
{{ template "base/footer" . }}