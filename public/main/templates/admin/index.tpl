{{ template "base/head" . }}
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            {{ template "admin/side_menu" .games }}
        </div>
        <div class="col col-lg">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Site settings</strong></p>
                <form method="post" action="/admin/">
                    <div class="row">
                        <div class="col">
                            <label for="sitename">Site Name</label>
                            {{ template "admin/index_form" .options.sitename }}
                        </div>
                        <div class="col">
                            <label for="siteurl">Site URL</label>
                            {{ template "admin/index_form" .options.siteurl }}
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="contact">Contact URL</label>
                            {{ template "admin/index_form" .options.contact }}
                        </div>
                        <div class="col">
                            <label for="bannerdisplay">Show Banner</label>
                            {{ template "admin/index_form" .options.bannerdisplay }}
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="bannerfile">Banner file name (in hlstatsimg/) or full banner URL</label></label>
                            {{ template "admin/index_form" .options.bannerfile }}
                        </div>
                        <div class="col">
                            <label for="playerinfo_tabs">Use tabs in playerinfo</label>
                            {{ template "admin/index_form" .options.playerinfo_tabs }}
                            <small id="emailHelp" class="form-text text-muted">Use tabs in playerinfo to show/hide
                                sections current
                                page or just show all at once</small>
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="slider">Enable AJAX gliding server list</label>
                            {{ template "admin/index_form" .options.slider }}
                            <small id="emailHelp" class="form-text text-muted">Enable AJAX gliding server list
                                (accordion effect) on
                                homepage of each game (only affects games with more than one server)</small>
                        </div>
                        <div class="col">
                            <label for="nav_globalchat"> Show Chat nav-link</label>
                            {{ template "admin/index_form" .options.nav_globalchat }}
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="nav_cheaters">Show Banned Players nav-link</label>
                            {{ template "admin/index_form" .options.nav_cheaters }}
                        </div>
                        <div class="col">
                            <label for="sourcebans_address">SourceBans URL</label>
                            {{ template "admin/index_form" .options.sourcebans_address }}
                            <small class="form-text text-muted">Enter the relative or full path to
                                your SourceBans web site, if you have one. Ex</label> http</label>
                                //www.yoursite.com/sourcebans/ or
                                /sourcebans/</small>
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="forum_address">Forum URL</label>
                            {{ template "admin/index_form" .options.forum_address }}
                            <small class="form-text text-muted">Enter the relative or full path to your
                                forum/message board, if you have one. Ex</label> http</label>//www.yoursite.com/forum/
                                or
                                /forum/</small>
                        </div>
                        <div class="col">
                            <label for="show_weapon_target_flash">Show hitbox flash animation</label>
                            {{ template "admin/index_form" .options.show_weapon_target_flash }}
                            <small class="form-text text-muted">Show hitbox flash animation instead of plain html
                                table for games with accuracy tracking (on supported games)</small>
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image"> Show load summaries from all monitored servers</label>
                            {{ template "admin/index_form" .options.show_server_load_image }}
                        </div>
                        <div class="col">
                            <label for="showqueries">Profiling message</label>
                            {{ template "admin/index_form" .options.showqueries }}
                            <small class="form-text text-muted">Show "Executed X queries, generated this page in Y
                                Seconds." message in footer?</small>
                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col">
                            <label for="sigbackground">Default background for forum signature</label>
                            {{ template "admin/index_form" .options.sigbackground }}
                            <small class="form-text text-muted"> Default background for forum signature(Numbers 1-11
                                or random)<br/>Look in sig folder to see background choices</small>
                        </div>

                        <div class="col">
                            <label for="modrewrite">Use modrewrite</label>
                            {{ template "admin/index_form" .options.modrewrite }}
                            <small class="form-text text-muted">Use modrewrite to make forum signature image
                                compatible with more forum types. (To utilize this, you <strong>must</strong> have
                                modrewrite enabled on your webserver and add the following text to a .htaccess file in
                                the directory of hlstats.php)<br/><br/><textarea rows="3" cols="54"
                                                                                 class="form-control" readonly>
RewriteEngine On
RewriteRule sig-(.*)-(.*).png$ sig.php?player_id=$1&background=$2 [L]</textarea></div>
                        </small>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>GeoIP data & Google Map settings</strong></p>
                <form method="post" action="/admin/">
                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Show features requiring GeoIP data</label>
                            {{ template "admin/index_form" .options.countrydata }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Show Google worldmap</label>
                            {{ template "admin/index_form" .options.show_google_map }}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Google Maps Region</label>
                            {{ template "admin/index_form" .options.google_map_region }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Google Maps Type</label>
                            {{ template "admin/index_form" .options.google_map_type }}
                        </div>
                    </div>
                    <label for="show_server_load_image">GeoCityLite data</label>
                    {{ template "admin/index_form" .options.UseGeoIPBinary }}
                    <small class="form-text text-muted">Choose whether to use GeoCityLite data loaded
                        into
                        mysql database or from binary file. (If binary, GeoLiteCity.dat goes in
                        perl/GeoLiteCity
                        and Geo</label></label>IP</label></label>PurePerl module is required</small>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Awards settings</strong></p>
                <form method="post" action="/admin/">

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Show daily award winners on Game Frontpage</label>
                            {{ template "admin/index_form" .options.gamehome_show_awards }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Daily Awards</label> columns count</label>
                            {{ template "admin/index_form" .options.awarddailycols }}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image"> Global Awards</label> columns count</label>
                            {{ template "admin/index_form" .options.awardglobalcols }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Player Ranks</label> columns count</label>
                            {{ template "admin/index_form" .options.awardrankscols }}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Ribbons</label> columns count</label>
                            {{ template "admin/index_form" .options.awardribbonscols }}
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Hit counter settings</strong></p>
                <form method="post" action="/admin/">

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Visit cookie timeout in minutes</label>
                            {{ template "admin/index_form" .options.counter_visit_timeout }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Current Visits</label>
                            {{ template "admin/index_form" .options.counter_visits }}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Current Page Hits</label>
                            {{ template "admin/index_form" .options.counter_hits }}
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Paths</strong></p>
                <form method="post" action="/admin/">

                    <label for="show_server_load_image">Map Download URL</label>
                    {{ template "admin/index_form" .options.map_dlurl }}
                    <small id="emailHelp" class="form-text text-muted">(%MAP% = map, %GAME% = gamecode). Leave blank to
                        suppress download link</small>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <hr>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Visual style settings</strong></p>
                <form method="post" action="/admin/">

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Server Load graph color hex#
                                (RRGGBB)</label>
                            {{ template "admin/index_form" .options.graphbg_load }}
                            <small id="emailHelp" class="form-text text-muted">RRGGBB</small>
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Server Load graph color text color# (RRGGBB)</label>
                            {{ template "admin/index_form" .options.graphtxt_load }}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Player Trend graph colour</label> </label>
                            {{ template "admin/index_form" .options.graphbg_trend }}
                            <small id="emailHelp" class="form-text text-muted">background color hex# (RRGGBB)</small>
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Player Trend graph</label> text color hex#
                            (RRGGBB)</label>

                            {{ template "admin/index_form" .options.graphtxt_trend }}
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Enable Gamelist icons</label>
                            {{ template "admin/index_form" .options.display_gamelist }}
                            <small id="emailHelp" class="form-text text-muted">Enables or Disables the
                                game icons near the top-right of all pages.</small>
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">Display Style Selector?</label>
                            {{ template "admin/index_form" .options.display_style_selector }}
                            <small id="emailHelp" class="form-text text-muted">Allow end users to change the style they
                                are
                                using.</small>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Stylesheet filename to use</label>
                            {{ template "admin/index_form" .options.style }}
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Ranking settings</strong></p>
                <form method="post" action="/admin/">

                    <div class="row">
                        <div class="col">
                            <label for="show_server_load_image">Ranking type</label>
                            {{ template "admin/index_form" .options.rankingtype }}
                        </div>

                        <div class="col">
                            <label for="show_server_load_image">HLstatsX will automatically hide players</label>
                            {{ template "admin/index_form" .options.MinActivity }}
                            <small id="emailHelp" class="form-text text-muted">which have no event more days than this
                                value. (Default 28 days)</small>
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Daemon Settings</strong></p>
                <form method="post" action="/admin/">

                    <label for="show_server_load_image">Sets the player-tracking mode</label>
                    {{ template "admin/index_form" .options.Mode }}
                    <small id="emailHelp" class="form-text text-muted">
                        <b>Steam ID</b> - Recommended for public Internet server use. Players will be tracked by Steam
                        ID.<br>
                        <b>Player Name</b> - Useful for shared-PC environments, such as Internet cafes, etc. Players
                        will be tracked by nickname. <br>
                        <b>IP Address</b> - Useful for LAN servers where players do not have a real Steam ID. Players
                        will be tracked by IP Address.
                    </small>

                    *Allow only servers set up in admin panel to be
                    tracked. Other servers will NOT automatically added and tracked! This is a big
                    security
                    thing</label>

                    {{ template "admin/index_form" .options.AllowOnlyConfigServers }}


                    *HLstatsX will automatically delete history
                    events
                    from the events tables when they are over this many days old. This is important for
                    performance reasons. Set lower if you are logging a large number of game servers or
                    find
                    the load on the MySQL server is too high</label>

                    {{ template "admin/index_form" .options.DeleteDays }}


                    *Resolve player IP addresses to hostnames.
                    Requires a
                    working DNS setup (on the box running hlstats.pl)</label>

                    {{ template "admin/index_form" .options.DNSResolveIP }}


                    *Time, in seconds, to wait for DNS queries to
                    complete before cancelling DNS resolves. You may need to increase this if on a slow
                    connection or if you find a lot of IPs are not being resolved; however, hlstats.pl
                    cannot be parsing log data while waiting for an IP to resolve</label>

                    {{ template "admin/index_form" .options.DNSTimeout }}


                    *E-mail address to mail database errors to</label>
                    {{ template "admin/index_form" .options.MailTo }}


                    *Path to the mail program -- usually
                    /usr/sbin/sendmail on webhosts</label>

                    {{ template "admin/index_form" .options.MailPath }}


                    *Allow HLstatsX to send Rcon commands to the game
                    servers</label>

                    {{ template "admin/index_form" .options.Rcon }}


                    *Ignore (do not log) Rcon commands originating
                    from
                    the same IP as the server being rcon-ed (useful if you run any kind of monitoring
                    script
                    which polls the server regularly by rcon)</label>

                    {{ template "admin/index_form" .options.RconIgnoreSelf }}


                    *Record Rcon commands to the Admin event table.
                    This
                    can be useful to see what your admins are doing, but if you run programs like PB it
                    can
                    also fill your database up with a lot of useless junk</label>

                    {{ template "admin/index_form" .options.RconRecord }}


                    *If no (default), use the current time on the
                    database server for the timestamp when recording events. If yes, use the timestamp
                    provided on the log data. Unless you are processing old log files on STDIN or your
                    game
                    server is in a different timezone than webhost, you probably want to set this to no</label>

                    {{ template "admin/index_form" .options.UseTimestamp }}


                    *Save how many players, kills etc, are in the
                    database each day and give access to graphical statistics</label>

                    {{ template "admin/index_form" .options.TrackStatsTrend }}


                    *Make player bans available on all participating
                    servers. Players who were banned permanently are automatic hidden from rankings</label>

                    {{ template "admin/index_form" .options.GlobalBanning }}


                    *Log player chat to database</label>
                    {{ template "admin/index_form" .options.LogChat }}


                    *Log admin chat to database</label>
                    {{ template "admin/index_form" .options.LogChatAdmins }}


                    *Broadcast chat messages through all particapting
                    servers. To all, none, or admins only</label>

                    {{ template "admin/index_form" .options.GlobalChat }}

                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Point calculation settings</strong></p>
                <form method="post" action="/admin/">


                    *Maximum number of skill points a player will
                    gain
                    from each frag. Default 25</label>

                    {{ template "admin/index_form" .options.SkillMaxChange }}


                    *Minimum number of skill points a player will
                    gain
                    from each frag. Default 2</label>

                    {{ template "admin/index_form" .options.SkillMinChange }}


                    *Number of kills a player must have before
                    receiving
                    regular points. (Before this threshold is reached, the killer and victim will only
                    gain/lose the minimum point value) Default 50</label>

                    {{ template "admin/index_form" .options.PlayerMinKills }}


                    *Cap killer's gained skill with ratio using
                    *XYZ*SaYnt's method "designed such that an excellent player will have to get about a
                    2</label>1
                    ratio against noobs to hold steady in points"</label>

                    {{ template "admin/index_form" .options.SkillRatioCap }}

                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>Proxy Settings</strong></p>
                <form method="post" action="/admin/">


                    *Key to use when sending remote commands to
                    Daemon,
                    empty for disable</label>

                    {{ template "admin/index_form" .options.Proxy_Key }}


                    *List of daemons to send PROXY events from (used
                    by
                    proxy-daemon.pl), use "," as delimiter, eg &lt;ip&gt;</label>&lt;port&gt;,&lt;ip&gt;</label>&lt;port&gt;,...
                    </label>

                    {{ template "admin/index_form" .options.Proxy_Daemons }}

                    <hr>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
{{ template "base/footer" . }}