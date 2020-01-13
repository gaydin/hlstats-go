{{ template "admin/base/head" . }}

        <div class="my-3 p-3 bg-white rounded shadow-sm">
            Enter the address of a server that you want to accept data from.<br/><br/>
            The "Public Address" should be the address you want shown to users. If left blank, it will be generated from
            the IP Address and Port. If you are using any kind of log relaying utility (i.e. hlstats.pl will not be
            receiving data directly from the game servers), you will want to set the IP Address and Port to the address
            of the log relay program, and set the Public Address to the real address of the game server. You will need a
            separate log relay for each game server. You can specify a hostname (or anything at all) in the Public
            Address.<p>
            <form method="post" action="/admin/game/{{ .game }}/newserver ">
                <div class="form-group">
                    <label for="exampleInputPassword1">Server IP Address</label>
                    <input type="text" class="form-control" name="server_address" maxlength="15" value="">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Server Port</label>
                    <input type="text" class="form-control" name="server_port" maxlength="5" value="">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Server Name</label>
                    <input type="text" class="form-control" name="server_name" maxlength="255" value="">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Rcon Password</label>
                    <input type="text" class="form-control" name="server_rcon" maxlength="128" value="">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Public Address</label>
                    <input type="text" class="form-control" name="public_address" maxlength="128" value="">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Admin Mod</label>
                    <select name="game_mod" class="custom-select">
                        {{ range .mods_supported }}
                            <option value="{{ .Code }}">{{ .Name }}</option>
                        {{ end }}
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

{{ template "admin/base/footer" . }}