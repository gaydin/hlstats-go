{{ template "base/head" . }}
<div class="row justify-content-center">
    <div class="col-sm-3">
        <div class="my-3 p-3 bg-white rounded shadow-sm">
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
                        <input type="button" class="btn btn-primary d-none" id="btnDiscard" 1
                               value="Discard Changes"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="ml-1">
                        <div class="row">
                            <div class="col-sm-5 col-md-3 col-6">
                                <label style="font-weight:bold;">Real Name</label>
                            </div>
                            <div class="col-md-8 col-6">
                                (Not Specified)
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-md-3 col-6">
                                <label style="font-weight:bold;">E-mail Address</label>
                            </div>
                            <div class="col-md-8 col-6">
                                (Not Specified)
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-md-3 col-6">
                                <label style="font-weight:bold;">Home Page</label>
                            </div>
                            <div class="col-md-8 col-6">
                                (Not Specified)
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-4 col-md-3 col-6">
                                <label style="font-weight:bold;">Total Connection Time</label>
                            </div>
                            <div class="col-md-8 col-6">
                                0d 22:10:41h
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-md-3 col-6">
                                <label style="font-weight:bold;">Average Ping</label>
                            </div>
                            <div class="col-md-8 col-6">
                                -
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-md-3 col-6">
                                <label style="font-weight:bold;">Favorite Server</label>
                            </div>
                            <div class="col-md-8 col-6">
                                *Ижевский сервер* WCS-TDM
                            </div>
                        </div>

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

                    </div>
                </div>
            </div>
        </div>
        <div class="my-3 p-3 bg-white rounded shadow-sm">
            График изменения рейтинга
            <canvas id="canvas"></canvas>
        </div>
    </div>
    <div class="col-sm-4">

        <div class="my-3 p-3 bg-white rounded shadow-sm">
            Statistics Summary

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Activity</label>
                </div>
                <div class="col-md-8 col-6">
                    Полоска
                </div>
                <div class="col-md-8 col-6">
                    (Not Specified)
                </div>
            </div>


            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Points</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Skill }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Rank</label>
                </div>
                <div class="col-md-8 col-6">
                    TODO
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Kills per Minute</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ if gt .player.ConnectionTime 0 }}
                        {{ .killsPerMinute }}
                    {{ else }}
                        -
                    {{ end }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Kills per Death</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Kpd.Float64 }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Headshots per Kill</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Hpk.Float64 }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Shots per Kill</label>
                </div>
                <div class="col-md-8 col-6">
                    TODO
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Weapon Accuracy</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Acc.Float64 }}%
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Headshots</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ if eq .player.Headshots 0 }}
                        TODO: realheadshots
                    {{ else }}
                        {{ .player.Headshots }}
                    {{ end }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Kills</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Kills }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Deaths</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Deaths }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Longest Kill Streak</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.KillStreak }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Longest Death Streak</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.DeathStreak }}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Suicides</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.Suicides }}
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-md-3 col-6">
                    <label>Teammate Kills</label>
                </div>
                <div class="col-md-8 col-6">
                    {{ .player.TeamKills }}
                </div>
            </div>
            <br/>
        </div>
    </div>
</div>

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