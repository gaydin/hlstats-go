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