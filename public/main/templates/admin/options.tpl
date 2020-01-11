{{ template "base/head" . }}
<main role="main" class="container">
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Site Name:</td>
                <td style="width:55%;"><input type="text" name="sitename" size="35" value="izh-games" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Site URL:</td>
                <td style="width:55%;"><input type="text" name="siteurl" size="35"
                                              value="http://izh-games.hlmod.ru/hlstats/hlstats.php" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Contact URL:</td>
                <td style="width:55%;"><input type="text" name="contact" size="35" value="your@email.address"
                                              class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show Banner:</td>
                <td style="width:55%;"><select name="bannerdisplay" style="width: 226px">
                        <option value="0">None
                        <option value="1">All Pages
                        <option value="2" selected="selected">Contents Page Only
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Banner file name (in hlstatsimg/) or full banner URL:</td>
                <td style="width:55%;"><input type="text" name="bannerfile" size="35" value="logo.gif" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Use tabs in playerinfo to show/hide sections current page or just
                    show all at once:
                </td>
                <td style="width:55%;"><select name="playerinfo_tabs" style="width: 226px">
                        <option value="1" selected="selected">New Style (hide sections by default)
                        <option value="0">Old Style (show all at once)
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Enable AJAX gliding server list (accordion effect) on homepage of
                    each game (only affects games with more than one server):
                </td>
                <td style="width:55%;"><select name="slider" style="width: 226px">
                        <option value="1" selected="selected">Enabled
                        <option value="0">Disabled
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show Chat nav-link:</td>
                <td style="width:55%;"><select name="nav_globalchat" style="width: 226px">
                        <option value="1" selected="selected">Show
                        <option value="0">Hide
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show Banned Players nav-link:</td>
                <td style="width:55%;"><select name="nav_cheaters" style="width: 226px">
                        <option value="0">Hide
                        <option value="1" selected="selected">Show
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">SourceBans URL<br/>Enter the relative or full path to your
                    SourceBans web site, if you have one. Ex: http://www.yoursite.com/sourcebans/ or /sourcebans/:
                </td>
                <td style="width:55%;"><input type="text" name="sourcebans_address" size="35"
                                              value="../SourceBans/index.php" class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Forum URL<br/>Enter the relative or full path to your
                    forum/message board, if you have one. Ex: http://www.yoursite.com/forum/ or /forum/:
                </td>
                <td style="width:55%;"><input type="text" name="forum_address" size="35" value="../index.php"
                                              class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show hitbox flash animation instead of plain html table for games
                    with accuracy tracking (on supported games):
                </td>
                <td style="width:55%;"><select name="show_weapon_target_flash" style="width: 226px">
                        <option value="1" selected="selected">Flash hitbox
                        <option value="0">HTML Table
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show load summaries from all monitored servers:</td>
                <td style="width:55%;"><select name="show_server_load_image" style="width: 226px">
                        <option value="0">Hide
                        <option value="1" selected="selected">Show
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show "Executed X queries, generated this page in Y Seconds."
                    message in footer?:
                </td>
                <td style="width:55%;"><select name="showqueries" style="width: 226px">
                        <option value="0">No
                        <option value="1" selected="selected">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Default background for forum signature(Numbers 1-11 or
                    random)<br/>Look in sig folder to see background choices:
                </td>
                <td style="width:55%;"><input type="text" name="sigbackground" size="35" value="random" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Use modrewrite to make forum signature image compatible with more
                    forum types. (To utilize this, you <strong>must</strong> have modrewrite enabled on your webserver
                    and add the following text to a .htaccess file in the directory of hlstats.php)<br/><br/><textarea
                            rows="3" cols="72" style="overflow:hidden;">
RewriteEngine On
RewriteRule sig-(.*)-(.*).png$ sig.php?player_id=$1&background=$2 [L]</textarea>:
                </td>
                <td style="width:55%;"><select name="modrewrite" style="width: 226px">
                        <option value="0" selected="selected">Disabled
                        <option value="1">Enabled
                    </select></td>
            </tr>
        </table>
        <p><strong>GeoIP data & Google Map settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show features requiring GeoIP data:</td>
                <td style="width:55%;"><select name="countrydata" style="width: 226px">
                        <option value="1" selected="selected">Show
                        <option value="0">Hide
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show Google worldmap:</td>
                <td style="width:55%;"><select name="show_google_map" style="width: 226px">
                        <option value="1">Show
                        <option value="0" selected="selected">Hide
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Google Maps Region:</td>
                <td style="width:55%;"><select name="google_map_region" style="width: 226px">
                        <option value="NORTH AMERICA">North America
                        <option value="NORTH EUROPE">North Europe
                        <option value="NORWAY">Norway
                        <option value="POLAND">Poland
                        <option value="ROMANIA">Romania
                        <option value="RUSSIA" selected="selected">Russia
                        <option value="SOUTH AFRICA">South Africa
                        <option value="SOUTH AMERICA">South America
                        <option value="SOUTH KOREA">South Korea
                        <option value="SPAIN">Spain
                        <option value="SUISSE">Suisse
                        <option value="SWEDEN">Sweden
                        <option value="TAIWAN">Taiwan
                        <option value="TURKEY">Turkey
                        <option value="UNITED KINGDOM">United Kingdom
                        <option value="ARGENTINA">Argentina
                        <option value="NORTH AFRICA">North Africa
                        <option value="NETHERLANDS">Netherlands
                        <option value="ASIA">Asia
                        <option value="AUSTRALIA">Australia
                        <option value="AUSTRIA">Austria
                        <option value="BELGIUM">Belgium
                        <option value="BRAZIL">Brazil
                        <option value="CHINA">China
                        <option value="DENMARK">Denmark
                        <option value="EAST EUROPE">East Europe
                        <option value="EUROPE">Europe
                        <option value="FINLAND">Finland
                        <option value="FRANCE">France
                        <option value="GERMANY">Germany
                        <option value="ITALY">Italy
                        <option value="JAPAN">Japan
                        <option value="WORLD">World
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Google Maps Type:</td>
                <td style="width:55%;"><select name="google_map_type" style="width: 226px">
                        <option value="HYBRID" selected="selected">Hybrid
                        <option value="MAP">Normal
                        <option value="PHYSICAL">Physical
                        <option value="SATELLITE">Satellite
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Choose whether to use GeoCityLite data loaded into mysql
                    database or from binary file. (If binary, GeoLiteCity.dat goes in perl/GeoLiteCity and
                    Geo::IP::PurePerl module is required:
                </td>
                <td style="width:55%;"><select name="UseGeoIPBinary" style="width: 226px">
                        <option value="0">GeoIP lookup via database
                        <option value="1" selected="selected">GeoIP lookup via binary file
                    </select></td>
            </tr>
        </table>
        <p><strong>Awards settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Show daily award winners on Game Frontpage:</td>
                <td style="width:55%;"><select name="gamehome_show_awards" style="width: 226px">
                        <option value="0" selected="selected">Hide
                        <option value="1">Show
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Daily Awards: columns count:</td>
                <td style="width:55%;"><input type="text" name="awarddailycols" size="35" value="5" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Global Awards: columns count:</td>
                <td style="width:55%;"><input type="text" name="awardglobalcols" size="35" value="5" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Player Ranks: columns count:</td>
                <td style="width:55%;"><input type="text" name="awardrankscols" size="35" value="5" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Ribbons: columns count:</td>
                <td style="width:55%;"><input type="text" name="awardribbonscols" size="35" value="5" class="textbox"
                                              maxlength="255"/></td>
            </tr>
        </table>
        <p><strong>Hit counter settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Visit cookie timeout in minutes:</td>
                <td style="width:55%;"><input type="text" name="counter_visit_timeout" size="35" value="5"
                                              class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Current Visits:</td>
                <td style="width:55%;"><input type="text" name="counter_visits" size="35" value="118390" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Current Page Hits:</td>
                <td style="width:55%;"><input type="text" name="counter_hits" size="35" value="124287" class="textbox"
                                              maxlength="255"/></td>
            </tr>
        </table>
        <p><strong>Paths</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Map Download URL<br/><span class="fSmall">(%MAP% = map, %GAME% = gamecode)</span>.
                    Leave blank to suppress download link.:
                </td>
                <td style="width:55%;"><input type="text" name="map_dlurl" size="35"
                                              value="http://izh-games.hlmod.ru/nmfails/serverfails/%GAME%/%MAP%.bsp.bz2"
                                              class="textbox" maxlength="255"/></td>
            </tr>
        </table>
        <p><strong>Visual style settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Server Load graph: background color hex# (RRGGBB):</td>
                <td style="width:55%;"><input type="text" name="graphbg_load" size="35" value="282828" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Server Load graph: text color# (RRGGBB):</td>
                <td style="width:55%;"><input type="text" name="graphtxt_load" size="35" value="FFFFFF" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Player Trend graph: background color hex# (RRGGBB):</td>
                <td style="width:55%;"><input type="text" name="graphbg_trend" size="35" value="282828" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Player Trend graph: text color hex# (RRGGBB):</td>
                <td style="width:55%;"><input type="text" name="graphtxt_trend" size="35" value="FFFFFF" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Stylesheet filename to use:</td>
                <td style="width:55%;"><select name="style" style="width: 226px">
                        <option value="ua_styles.css">Ua Styles</option>
                        <option value="tsgk_black.css">Tsgk Black</option>
                        <option value="light_blue.css">Light Blue</option>
                        <option value="red_riot.css">Red Riot</option>
                        <option value="nom_nom_nom.css">Nom Nom Nom</option>
                        <option value="electro_1337.css">Electro 1337</option>
                        <option value="plain_white.css">Plain White</option>
                        <option value="sourcebans.css" selected="selected">Sourcebans</option>
                        <option value="classic.css">Classic</option>
                        <option value="light_grey.css">Light Grey</option>
                        <option value="psychonic.css">Psychonic</option>
                        <option value="murd4candy.css">Murd4candy</option>
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Display Style Selector?<br/>Allow end users to change the style
                    they are using.:
                </td>
                <td style="width:55%;"><select name="display_style_selector" style="width: 226px">
                        <option value="0" selected="selected">No
                        <option value="1">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">Enable Gamelist icons<br/>Enables or Disables the game icons near
                    the top-right of all pages.:
                </td>
                <td style="width:55%;"><select name="display_gamelist" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
        </table>
        <p><strong>Ranking settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Ranking type:</td>
                <td style="width:55%;"><select name="rankingtype" style="width: 226px">
                        <option value="skill" selected="selected">Skill
                        <option value="kills">Kills
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*HLstatsX will automatically hide players which have no event
                    more days than this value. (Default 28 days):
                </td>
                <td style="width:55%;"><input type="text" name="MinActivity" size="35" value="28" class="textbox"
                                              maxlength="255"/></td>
            </tr>
        </table>
        <p><strong>Daemon Settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Sets the player-tracking mode.<br>
                    <ul>
                        <LI><b>Steam ID</b> - Recommended for public Internet server use. Players will be tracked by
                            Steam ID.
                        <LI><b>Player Name</b> - Useful for shared-PC environments, such as Internet cafes, etc. Players
                            will be tracked by nickname.
                        <LI><b>IP Address</b> - Useful for LAN servers where players do not have a real Steam ID.
                            Players will be tracked by IP Address.
                    </UL>
                    :
                </td>
                <td style="width:55%;"><select name="Mode" style="width: 226px">
                        <option value="Normal">Steam ID (recommended)
                        <option value="LAN">IP Address
                        <option value="NameTrack">Player Name
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Allow only servers set up in admin panel to be tracked. Other
                    servers will NOT automatically added and tracked! This is a big security thing:
                </td>
                <td style="width:55%;"><select name="AllowOnlyConfigServers" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*HLstatsX will automatically delete history events from the
                    events tables when they are over this many days old. This is important for performance reasons. Set
                    lower if you are logging a large number of game servers or find the load on the MySQL server is too
                    high:
                </td>
                <td style="width:55%;"><input type="text" name="DeleteDays" size="35" value="28" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Resolve player IP addresses to hostnames. Requires a working DNS
                    setup (on the box running hlstats.pl):
                </td>
                <td style="width:55%;"><select name="DNSResolveIP" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Time, in seconds, to wait for DNS queries to complete before
                    cancelling DNS resolves. You may need to increase this if on a slow connection or if you find a lot
                    of IPs are not being resolved; however, hlstats.pl cannot be parsing log data while waiting for an
                    IP to resolve:
                </td>
                <td style="width:55%;"><input type="text" name="DNSTimeout" size="35" value="3" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*E-mail address to mail database errors to:</td>
                <td style="width:55%;"><input type="text" name="MailTo" size="35" value="" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Path to the mail program -- usually /usr/sbin/sendmail on
                    webhosts:
                </td>
                <td style="width:55%;"><input type="text" name="MailPath" size="35" value="/usr/sbin/sendmail"
                                              class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Allow HLstatsX to send Rcon commands to the game servers:</td>
                <td style="width:55%;"><select name="Rcon" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Ignore (do not log) Rcon commands originating from the same IP
                    as the server being rcon-ed (useful if you run any kind of monitoring script which polls the server
                    regularly by rcon):
                </td>
                <td style="width:55%;"><select name="RconIgnoreSelf" style="width: 226px">
                        <option value="0">No
                        <option value="1" selected="selected">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Record Rcon commands to the Admin event table. This can be
                    useful to see what your admins are doing, but if you run programs like PB it can also fill your
                    database up with a lot of useless junk:
                </td>
                <td style="width:55%;"><select name="RconRecord" style="width: 226px">
                        <option value="0" selected="selected">No
                        <option value="1">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*If no (default), use the current time on the database server for
                    the timestamp when recording events. If yes, use the timestamp provided on the log data. Unless you
                    are processing old log files on STDIN or your game server is in a different timezone than webhost,
                    you probably want to set this to no:
                </td>
                <td style="width:55%;"><select name="UseTimestamp" style="width: 226px">
                        <option value="0" selected="selected">No
                        <option value="1">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Save how many players, kills etc, are in the database each day
                    and give access to graphical statistics:
                </td>
                <td style="width:55%;"><select name="TrackStatsTrend" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Make player bans available on all participating servers. Players
                    who were banned permanently are automatic hidden from rankings:
                </td>
                <td style="width:55%;"><select name="GlobalBanning" style="width: 226px">
                        <option value="0" selected="selected">No
                        <option value="1">Yes
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Log player chat to database:</td>
                <td style="width:55%;"><select name="LogChat" style="width: 226px">
                        <option value="1" selected="selected">Yes
                        <option value="0">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Log admin chat to database:</td>
                <td style="width:55%;"><select name="LogChatAdmins" style="width: 226px">
                        <option value="1">Yes
                        <option value="0" selected="selected">No
                    </select></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Broadcast chat messages through all particapting servers. To
                    all, none, or admins only:
                </td>
                <td style="width:55%;"><select name="GlobalChat" style="width: 226px">
                        <option value="0" selected="selected">None
                        <option value="1">Broadcast to all
                        <option value="2">Broadcast to admins
                    </select></td>
            </tr>
        </table>
        <p><strong>Point calculation settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Maximum number of skill points a player will gain from each
                    frag. Default 25:
                </td>
                <td style="width:55%;"><input type="text" name="SkillMaxChange" size="35" value="25" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Minimum number of skill points a player will gain from each
                    frag. Default 2:
                </td>
                <td style="width:55%;"><input type="text" name="SkillMinChange" size="35" value="2" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Number of kills a player must have before receiving regular
                    points. (Before this threshold is reached, the killer and victim will only gain/lose the minimum
                    point value) Default 50:
                </td>
                <td style="width:55%;"><input type="text" name="PlayerMinKills" size="35" value="50" class="textbox"
                                              maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Cap killer's gained skill with ratio using *XYZ*SaYnt's method
                    "designed such that an excellent player will have to get about a 2:1 ratio against noobs to hold
                    steady in points":
                </td>
                <td style="width:55%;"><select name="SkillRatioCap" style="width: 226px">
                        <option value="0" selected="selected">No
                        <option value="1">Yes
                    </select></td>
            </tr>
        </table>
        <p><strong>Proxy Settings</strong></p>
        <table class="data-table" style="width:75%">
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*Key to use when sending remote commands to Daemon, empty for
                    disable:
                </td>
                <td style="width:55%;"><input type="text" name="Proxy_Key" size="35" value="a9c295bfd78975336015a8b6"
                                              class="textbox" maxlength="255"/></td>
            </tr>
            <tr class="bg1" style="vertical-align:middle" ;>
                <td class="fNormal" style="width:45%;">*List of daemons to send PROXY events from (used by
                    proxy-daemon.pl), use "," as delimiter, eg &lt;ip&gt;:&lt;port&gt;,&lt;ip&gt;:&lt;port&gt;,... :
                </td>
                <td style="width:55%;"><input type="text" name="Proxy_Daemons" size="35" value="" class="textbox"
                                              maxlength="255"/></td>
            </tr>
        </table>
        <tr style="height:50px;">
            <td style="text-align:center;" colspan="2"><input type="submit" value="  Apply  " class="submit"/></td>
        </tr>
        </table>
</main>
</div>
{{ template "base/footer" . }}