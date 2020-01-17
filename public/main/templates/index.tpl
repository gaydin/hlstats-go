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
            </tr>
            </thead>
            <tbody>
            {{ range .games }}
                <tr>
                    <td><a href="/game/{{ .Game.Code }}/"><img src="/public/hlstatsimg/games/{{ .Game.Code }}/game.png" alt="css"/>{{ .Game.Name }}</a></td>
                    <td>{{ .NumPlayers }}</td>
                    <td>
                        {{ $topPlayer := index $topPlayers .Game.Code}}
                        {{ if $topPlayer }}
                            <a href="/player/{{ $topPlayer.ID }}">{{ $topPlayer.LastName}}</a>
                        {{ end }}
                    </td>
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