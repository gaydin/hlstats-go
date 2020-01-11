{{ template "base/head" . }}
<main role="main" class="container">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        {{ if ( .playersLastDay ) and gt .playersLastDay -1}}
            Tracking <b>{{ .totalPlayers }}</b> players (<b>+{{ .players_last_day }}</b> new players last 24h) with<b>{{ .total_kills }}</b> kills (<b>+{{ .kills_last_day }}</b> last 24h) and<b>{{ .totalHeadshots }}</b> headshots (<b>{{ .hpk }}%</b>) on <b>{{ .totalServers }}</b> servers
        {{ else }}
            Tracking <b>{{ .totalPlayers }}</b> players with <b>{{ .totalKills }}</b> kills and <b>{{ .totalHeadshots }}</b> headshots (<b>{{ .hpk }}%</b>) on <b>{{ .totalServers }}</b> servers
        {{ end }}
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Сервер</th>
                <th scope="col">Адрес</th>
                <th scope="col">Карта</th>
                <th scope="col">Время</th>
                <th scope="col">Игроки</th>
                <th scope="col">Фраги</th>
                <th scope="col">Хедшоты</th>
                <th scope="col">Х:Ф</th>
            </tr>
            </thead>
            <tbody>
            {{ range .servers }}
                <tr>
                    <td><img src="/public/hlstatsimg/games/css/game.png"
                             alt="css"/>&nbsp;<b>{{ .Name }}</b></td>
                    <td>{{ .Addr }}</td>
                    <td>{{ .ActMap }}</td>
                    <td>{{ .MapStarted }}</td>
                    <td>{{ .ActPlayers }} / {{ .MaxPlayers }}</td>
                    <td>{{ .Kills }}</td>
                    <td>{{ .HeadShots }}</td>
                    {{ if gt .Kills 0}}
                        <td></td>
                    {{ else }}
                        <td>0</td>
                    {{ end }}
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