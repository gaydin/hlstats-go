{{ $root := . }}
{{ template "admin/base/head" . }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    Enter the codes and full names for all the games you want to collect statistics for. (Game codes
    should be the same as the mod folder name, e.g. "valve".)<br/><br/>

    After creating a game, you will be able to configure servers, awards, etc. for that game under
    Game Settings.<br/><br/>

    <strong>NOTE</strong>: Be cautious of deleting a game. Deleting a game will remove all related
    settings, including servers, players, and events for that game (and may take a while). You will
    have to manually remove any images yourself. IF YOU DELETE THE LAST GAME OF A TYPE, THERE IS NO
    EASY WAY TO MAKE A NEW GAME OF THAT TYPE. If you want to delete and that is the case, you are
    probably better off deleting all servers for that game and then just hiding the game.<br/><br/>
</div>
{{ template "base/flash" .flash }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <form method="post" action="/admin/games ">
        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Game Code</th>
                <th scope="col">Display Name</th>
                <th scope="col">Game</th>
                <th scope="col">Hide Game</th>
            </tr>
            </thead>
            <tbody>
            {{ range $i, $game := .games }}
                <tr>
                    <th scope="row"><img src="/public/hlstatsimg/games/{{ $game.Code }}/game.png" width="16" height="16"
                                         border="0"
                                         alt=""/></th>
                    <td><input type="hidden" name="rows[]" value="{{ $game.Code }}"/>{{ $game.Code }}
                    </td>
                    <td><input type="text" name="{{ $game.Code }}_name" class="form-control"
                               value="{{ $game.Name }}"></td>
                    <td><select name="{{ $game.Code }}_realgame"  class="custom-select" >
                            {{ range $root.supported_games }}
                                <option value="{{ .Code }}"
                                        {{ if eq $game.RealGame .Code }}selected="selected"{{ end }}>{{ .Name }}</option>
                            {{ end }}
                        </select></td>
                    <td>
                        <div class="form-group form-check">
                            <input type="checkbox" name="{{ .Code }}_hidden" class="form-check-input"
                                   value="1" {{ if eq .Hidden 1 }}checked="checked"{{ end }}>
                        </div>
                    </td>
                </tr>
            {{ end }}
            </tbody>
        </table>
        <hr>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{{ template "admin/base/footer" . }}