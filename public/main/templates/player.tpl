{{ template "base/head" . }}
<main role="main" class="container-fluid">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <div class="row">
            <div class="col-sm">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <img src="/public/hlstatsimg/unknown.jpg" style="width: 200px; height: 200px"
                                         alt="Steam Community Avatar" class="img-thumbnail"/>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><img
                                                src="/public/hlstatsimg/flags/{{ GetFlag .player.Flag }}.gif"
                                                alt="Russian Federation"
                                                title="Russian Federation"/>&nbsp;{{ .player.LastName}}</h2>
                                    <h6 class="d-block">                                    {{ if ne .player.Country "" }}
                                            Location: <a
                                                    href="/hlstats.php?mode=countryclansinfo&flag={{ .player.Flag }}&game=css">{{ .player.Country }}</a>
                                        {{ else }}
                                            Location: (Unknown)
                                        {{ end }}</h6>
                                    <h6 class="d-block">Steam: <a href="http://steamcommunity.com/profiles/{{ .COID }}"
                                                                  target="_blank">{{ .UQID }}</a></h6>
                                    <h6 class="d-block">Status: (Unknown)</h6>
                                    <h6 class="d-block">Karma: In good standing</h6>
                                    <h6 class="d-block">Member of Clan: {{ if ne .player.Clan 0 }}
                                            <a href="?mode=claninfo&amp;clan={{ .player.Clan }}">{{ .player.ClanName.Value }}</a>
                                        {{ else }}
                                            (None)
                                        {{ end}}</h6>
                                    <h6 class="d-block">Last Connect: Sat. May. 4th, 2013 @ 21:31:18</h6>
                                </div>
                                <div class="ml-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard"
                                           value="Discard Changes"/>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Real Name</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            (Not Specified)
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">E-mail Address</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            (Not Specified)
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Home Page</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            (Not Specified)
                                        </div>
                                    </div>
                                    <hr/>

                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Total Connection Time</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            0d 22:10:41h
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Average Ping</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            -
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Favorite Server</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            *Ижевский сервер* WCS-TDM
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Favorite Map</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            {{ if .favoriteMap }}
                                                <a href="hlstats.php?game=css&mode=mapinfo&map={{ .favoriteMap.Map }}">{{ .favoriteMap.Map }}</a>
                                            {{ end}}
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-sm-4 col-md-3 col-6">
                                            <label style="font-weight:bold;">Favorite Weapon</label>
                                        </div>
                                        <div class="col-md-8 col-6">
                                            {{ if .favoriteWeapon }}
                                                <strong>
                                                    <a href="hlstats.php?mode=weaponinfo&weapon={{ .favoriteWeapon.Weapon }};game=css">{{ .favoriteWeapon.Name }}</a>
                                                </strong>
                                            {{ end}}
                                        </div>
                                    </div>
                                    <hr/>
                                </div>
                            </div>
                        </div>
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
                </div>
                <br>
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