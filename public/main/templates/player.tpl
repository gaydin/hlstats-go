{{ template "base/head" . }}
<main role="main" class="container">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <div class="row">
            <div class="col-sm">
                <div class="card">
                    <div class="card-header">
                        Player Profile
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <tr class="data-table-head">
                                <td style="text-align:center; vertical-align:middle;" rowspan="7"
                                    id="player_avatar">
                                    <img src="/public/hlstatsimg/unknown.jpg" style="height:158px;width:158px;"
                                         alt="Steam Community Avatar"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="/public/hlstatsimg/flags/{{ GetFlag .player.Flag }}.gif"
                                         alt="Russian Federation"
                                         title="Russian Federation"/>&nbsp;<strong>{{ .player.LastName}}</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    {{ if ne .player.Country "" }}
                                        Location: <a
                                                href="/hlstats.php?mode=countryclansinfo&flag={{ .player.Flag }}&game=css">{{ .player.Country }}</a>
                                    {{ else }}
                                        Location: (Unknown)
                                    {{ end }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Steam: <a href="http://steamcommunity.com/profiles/{{ .COID }}"
                                              target="_blank">{{ .UQID }}</a></td>
                            </tr>
                            <tr>
                                <td>Status: <strong>(Unknown)</strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="steam://friends/add/76561197971401819" target="_blank">Click here to
                                        add as friend</a>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:50%;">Member of Clan:</td>
                                <td style="width:50%;">
                                    {{ if ne .player.Clan 0 }}
                                        <a href="?mode=claninfo&amp;clan={{ .player.Clan }}">{{ .player.ClanName.Value }}</a>
                                    {{ else }}
                                        (None)
                                    {{ end}}
                                </td>
                            </tr>
                            <tr>
                                <td>Favorite Map:*</td>
                                <td>
                                    {{ if .favoriteMap }}
                                        <a href="hlstats.php?game=css&mode=mapinfo&map={{ .favoriteMap.Map }}">{{ .favoriteMap.Map }}</a>
                                    {{ end}}
                                </td>
                            </tr>
                            <tr>
                                <td>Favorite Weapon:*</td>
                                <td>
                                    {{ if .favoriteWeapon }}
                                        <strong>
                                            <a href="hlstats.php?mode=weaponinfo&weapon={{ .favoriteWeapon.Weapon }};game=css">{{ .favoriteWeapon.Name }}</a>
                                        </strong>
                                    {{ end}}
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm">
                <div class="card">
                    <div class="card-header">
                        График изменения рейтинга
                    </div>
                    <div class="card-body">
                        <canvas id="canvas"></canvas>
                    </div>
                </div><br>
                <div class="card">
                    <div class="card-header">
                        Общая статистика
                    </div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <td style="width:50%;">Activity:</td>
                                <td style="width:35%;">
                                    <img src="/public/hlstatsimg/bar6.gif" style="width:60%;height:10px;border:0;"
                                         alt="60%"/>
                                </td>
                                <td style="width:15%;">60%</td>
                            </tr>
                            <tr>
                                <td>Points:</td>
                                <td style="width:55%;" colspan="2">
                                    <b>{{ .player.Skill }}</b></td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Rank:</td>
                                <td style="width:55%;" colspan="2">
                                    <b>3</b></td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Kills per Minute:</td>
                                <td style="width:55%;" colspan="2">
                                    4.13
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Kills per Death:</td>
                                <td style="width:55%;" colspan="2">
                                    2.4420 (-*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Headshots per Kill:</td>
                                <td style="width:55%;" colspan="2">
                                    1.0000 (-*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Shots per Kill:</td>
                                <td style="width:55%;" colspan="2">
                                    -
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Weapon Accuracy:</td>
                                <td style="width:55%;" colspan="2">
                                    28.3% (0%*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Headshots:</td>
                                <td style="width:55%;" colspan="2">
                                    337 (0*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Kills:</td>
                                <td style="width:55%;" colspan="2">
                                    337 (0*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Deaths:</td>
                                <td style="width:55%;" colspan="2">
                                    138 (0*)
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Longest Kill Streak:</td>
                                <td style="width:55%;" colspan="2">
                                    18
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Longest Death Streak:</td>
                                <td style="width:55%;" colspan="2">
                                    6
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Suicides:</td>
                                <td style="width:55%;" colspan="2">
                                    0
                                </td>
                            </tr>
                            <tr>
                                <td style="width:45%;">Teammate Kills:</td>
                                <td style="width:55%;" colspan="2">
                                    0 (0*)
                                </td>
                            </tr>
                        </table>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    var config = {
        type: 'line',
        data: {{ .chartData }},
        options: {
            responsive: true,
            hoverMode: 'index',
            stacked: false,
            scales: {
                yAxes: [{
                    type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                    display: true,
                    position: 'left',
                    id: 'y-axis-1',
                }, {
                    type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                    display: true,
                    position: 'right',
                    id: 'y-axis-2',

                    // grid line settings
                    gridLines: {
                        drawOnChartArea: false, // only want the grid lines for one axis to show up
                    },
                }],
            }
        }
    };

    window.onload = function () {
        var ctx = document.getElementById('canvas').getContext('2d');
        window.myLine = new Chart(ctx, config);
    };
</script>
{{ template "base/footer" . }}