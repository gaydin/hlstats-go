{{ template "base/head" . }}
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col col-lg">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <form method="post" action="/admin/">
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Site Name
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.sitename }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Site URL
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.siteurl }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Contact URL
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.contact }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show Banner
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.bannerdisplay }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Banner file name (in hlstatsimg/) or full banner
                            URL:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.bannerfile }}
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Use tabs in playerinfo to show/hide sections current
                            page or just show all at once:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.playerinfo_tabs }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Enable AJAX gliding server list (accordion effect) on
                            homepage of each game (only affects games with more than one server):
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.slider }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show Chat nav-link
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.nav_globalchat }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show Banned Players nav-link
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.nav_cheaters }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            SourceBans URL<br/>Enter the relative or full path to
                            your SourceBans web site, if you have one. Ex: http://www.yoursite.com/sourcebans/ or
                            /sourcebans/:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.sourcebans_address }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Forum URL<br/>Enter the relative or full path to your
                            forum/message board, if you have one. Ex: http://www.yoursite.com/forum/ or /forum/:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.forum_address }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show hitbox flash animation instead of plain html
                            table for games with accuracy tracking (on supported games):
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.show_weapon_target_flash }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show load summaries from all monitored servers
                        </div>
                        <div class="col-md-8 col-6">
                            {{ template "admin/index_form" .options.show_server_load_image }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Show "Executed X queries, generated this page in Y
                            Seconds." message in footer?:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.showqueries }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Default background for forum signature(Numbers 1-11
                            or random)<br/>Look in sig folder to see background choices:
                        </div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.sigbackground }}</div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-sm-5 col-md-4 col-7">
                            Use modrewrite to make forum signature image
                            compatible with more forum types. (To utilize this, you <strong>must</strong> have
                            modrewrite enabled on your webserver and add the following text to a .htaccess file in
                            the directory of hlstats.php)<br/><br/><textarea rows="3" cols="54"
                                                                             style="overflow:hidden;">
RewriteEngine On
RewriteRule sig-(.*)-(.*).png$ sig.php?player_id=$1&background=$2 [L]</textarea></div>
                        <div class="col-md-8 col-6">

                            {{ template "admin/index_form" .options.modrewrite }}</div>
                    </div>
            </div>
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <p><strong>GeoIP data & Google Map settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Show features requiring GeoIP data:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.countrydata }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Show Google worldmap:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.show_google_map }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Google Maps Region:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.google_map_region }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Google Maps Type:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.google_map_type }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Choose whether to use GeoCityLite data loaded into
                            mysql database or from binary file. (If binary, GeoLiteCity.dat goes in perl/GeoLiteCity
                            and Geo::IP::PurePerl module is required:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.UseGeoIPBinary }}</td>
                    </tr>
                </table>
                <p><strong>Awards settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Show daily award winners on Game Frontpage:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.gamehome_show_awards }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Daily Awards: columns count:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.awarddailycols }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Global Awards: columns count:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.awardglobalcols }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Player Ranks: columns count:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.awardrankscols }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Ribbons: columns count:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.awardribbonscols }}</td>
                    </tr>
                </table>
                <p><strong>Hit counter settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Visit cookie timeout in minutes:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.counter_visit_timeout }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Current Visits:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.counter_visits }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Current Page Hits:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.counter_hits }}</td>
                    </tr>
                </table>
                <p><strong>Paths</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Map Download URL<br/><span class="fSmall">(%MAP% = map, %GAME% = gamecode)</span>.
                            Leave blank to suppress download link.:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.map_dlurl }}</td>
                    </tr>
                </table>
                <p><strong>Visual style settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Server Load graph: background color hex# (RRGGBB):
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.graphbg_load }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Server Load graph: text color# (RRGGBB):</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.graphtxt_load }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Player Trend graph: background color hex# (RRGGBB):
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.graphbg_trend }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Player Trend graph: text color hex# (RRGGBB):</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.graphtxt_trend }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Stylesheet filename to use:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.style }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Display Style Selector?<br/>Allow end users to change
                            the style they are using.:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.display_style_selector }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">Enable Gamelist icons<br/>Enables or Disables the
                            game icons near the top-right of all pages.:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.display_gamelist }}</td>
                    </tr>
                </table>
                <p><strong>Ranking settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Ranking type:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.rankingtype }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*HLstatsX will automatically hide players which have
                            no event more days than this value. (Default 28 days):
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.MinActivity }}</td>
                    </tr>
                </table>
                <p><strong>Daemon Settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Sets the player-tracking mode.<br>
                            <ul>
                                <LI><b>Steam ID</b> - Recommended for public Internet server use. Players will be
                                    tracked by Steam ID.
                                <LI><b>Player Name</b> - Useful for shared-PC environments, such as Internet cafes,
                                    etc. Players will be tracked by nickname.
                                <LI><b>IP Address</b> - Useful for LAN servers where players do not have a real
                                    Steam ID. Players will be tracked by IP Address.
                            </UL>
                            :
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.Mode }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Allow only servers set up in admin panel to be
                            tracked. Other servers will NOT automatically added and tracked! This is a big security
                            thing:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.AllowOnlyConfigServers }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*HLstatsX will automatically delete history events
                            from the events tables when they are over this many days old. This is important for
                            performance reasons. Set lower if you are logging a large number of game servers or find
                            the load on the MySQL server is too high:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.DeleteDays }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Resolve player IP addresses to hostnames. Requires a
                            working DNS setup (on the box running hlstats.pl):
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.DNSResolveIP }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Time, in seconds, to wait for DNS queries to
                            complete before cancelling DNS resolves. You may need to increase this if on a slow
                            connection or if you find a lot of IPs are not being resolved; however, hlstats.pl
                            cannot be parsing log data while waiting for an IP to resolve:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.DNSTimeout }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*E-mail address to mail database errors to:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.MailTo }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Path to the mail program -- usually
                            /usr/sbin/sendmail on webhosts:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.MailPath }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Allow HLstatsX to send Rcon commands to the game
                            servers:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.Rcon }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Ignore (do not log) Rcon commands originating from
                            the same IP as the server being rcon-ed (useful if you run any kind of monitoring script
                            which polls the server regularly by rcon):
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.RconIgnoreSelf }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Record Rcon commands to the Admin event table. This
                            can be useful to see what your admins are doing, but if you run programs like PB it can
                            also fill your database up with a lot of useless junk:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.RconRecord }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*If no (default), use the current time on the
                            database server for the timestamp when recording events. If yes, use the timestamp
                            provided on the log data. Unless you are processing old log files on STDIN or your game
                            server is in a different timezone than webhost, you probably want to set this to no:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.UseTimestamp }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Save how many players, kills etc, are in the
                            database each day and give access to graphical statistics:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.TrackStatsTrend }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Make player bans available on all participating
                            servers. Players who were banned permanently are automatic hidden from rankings:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.GlobalBanning }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Log player chat to database:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.LogChat }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Log admin chat to database:</td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.LogChatAdmins }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Broadcast chat messages through all particapting
                            servers. To all, none, or admins only:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.GlobalChat }}</td>
                    </tr>
                </table>
                <p><strong>Point calculation settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Maximum number of skill points a player will gain
                            from each frag. Default 25:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.SkillMaxChange }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Minimum number of skill points a player will gain
                            from each frag. Default 2:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.SkillMinChange }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Number of kills a player must have before receiving
                            regular points. (Before this threshold is reached, the killer and victim will only
                            gain/lose the minimum point value) Default 50:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.PlayerMinKills }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Cap killer's gained skill with ratio using
                            *XYZ*SaYnt's method "designed such that an excellent player will have to get about a 2:1
                            ratio against noobs to hold steady in points":
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.SkillRatioCap }}</td>
                    </tr>
                </table>
                <p><strong>Proxy Settings</strong></p>
                <table class="data-table" style="width:75%">
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*Key to use when sending remote commands to Daemon,
                            empty for disable:
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.Proxy_Key }}</td>
                    </tr>
                    <tr class="bg1" style="vertical-align:middle" ;>
                        <td class="fNormal" style="width:45%;">*List of daemons to send PROXY events from (used by
                            proxy-daemon.pl), use "," as delimiter, eg &lt;ip&gt;:&lt;port&gt;,&lt;ip&gt;:&lt;port&gt;,...
                            :
                        </td>
                        <td style="width:55%;">{{ template "admin/index_form" .options.Proxy_Daemons }}</td>
                    </tr>
                </table>
                <tr style="height:50px;">
                    <td style="text-align:center;" colspan="2"><input type="submit" value="  Apply  "
                                                                      class="submit"/></td>
                </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
</div>
{{ template "base/footer" . }}