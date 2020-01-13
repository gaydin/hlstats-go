{{ template "base/head" . }}
<div class="row justify-content-center">
    <div class="col-sm-2">
        {{ template "admin/side_menu" .menu_games }}
    </div>
    <div class="col-sm-9">
        <div class="my-3 p-3 bg-white rounded shadow-sm">
            <form method="post" action="/admin/game/{{ .game }}/servers">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">IP Address</th>
                        <th scope="col">Port</th>
                        <th scope="col">Server Name</th>
                        <th scope="col">Rcon Password</th>
                        <th scope="col">Public Address</th>
                        <th scope="col">Game</th>
                        <th scope="col">Sort Order</th>
                        <th scope="col"></th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    {{ range .servers }}
                        <tr>
                            <td>{{ .ServerID }}</td>
                            <td>
                                <input type="hidden" name="rows[]" value="{{ .ServerID }}">
                                <input type="text" class="form-control" name="{{ .ServerID }}_address"
                                       size=15
                                       value="{{ .Address }}"
                                       maxlength="15">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="{{ .ServerID }}_port"
                                       size=6
                                       value="{{ .Port }}"
                                       maxlength="5">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="{{ .ServerID }}_name"
                                       size=35
                                       value="{{ .Name }}"
                                       maxlength="255">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="{{ .ServerID }}_rcon_password"
                                       size=10
                                       value="(encrypted)"
                                       maxlength="128"
                                       onclick="if (this.value == '(encrypted)') this.value='';"/>
                            </td>
                            <td>
                                <input type="text" class="form-control" name="{{ .ServerID }}_publicaddress" size=15
                                       value="{{ .PublicAddress }}" maxlength="128">
                            </td>
                            <td>
                                <select name="{{ .ServerID }}_game" class="custom-select">
                                    <option value="css" selected="selected">Counter-Strike: Source</option>
                                    <option value="cssnosteam">Counter-Strike: Source NO-Steam</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="{{ .ServerID }}_sortorder" size=2 value="{{ .SortOrder }}"
                                       class="textbox" maxlength="255"
                                       onclick="if (this.value == '(encrypted)') this.value='';">
                            </td>
                            <td>
                                <a href='TODO'><b>CONFIGURE</b></a>
                            </td>
                            <td>
                                <input type="checkbox" name="{{ .ServerID }}_delete" value="{{ .ServerID }}">
                            </td>
                        </tr>
                    {{ end }}
                    </tbody>
                </table>
                <hr>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
{{ template "base/footer" . }}