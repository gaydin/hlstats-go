{{ template "base/head" . }}
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            {{ template "admin/side_menu" . }}
        </div>
        <div class="col col-lg">
            <div class="my-3 p-3 bg-white rounded shadow-sm">
                <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="98%">
                        Usernames and passwords can be set up for access to this HLstats Admin area. For most sites you
                        will only want one admin user - yourself. Some sites may however need to give administration
                        access to several people.<p>

                            <b>Note</b> Passwords are encrypted in the database and so cannot be viewed. However, you
                            can change a user's password by entering a new plain text value in the Password field.
                        <p>

                            <b>Access Levels</b><br>

                            &#149; <i>Restricted</i> users only have access to the Host Groups, Clan Tag Patterns,
                            Weapons, Teams, Awards and Actions configuration areas. This means these users cannot set
                            Options or add new Games, Servers or Admin Users to HLstats, or use any of the admin
                            Tools.<br>
                            &#149; <i>Administrator</i> users have full, unrestricted access.
                        <p>

                        <form method="post" action="/admin/users">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Access Level</th>
                                    <th scope="col">Delete</th>
                                </tr>
                                </thead>
                                <tbody>
                                {{ range .users }}
                                    <tr>
                                        <th scope="row"><img src="/public/hlstatsimg/user.gif" width="16" height="16"
                                                             border="0"
                                                             alt=""/></th>
                                        <td><input type="text" name="{{ .Username }}_username" class="form-control"
                                                   value="{{ .Username }}"></td>
                                        <td><input type="password" name="{{ .Username }}_password" class="form-control"
                                                   placeholder="( encrypted )"></td>
                                        <td><select name="{{ .Username }}_acclevel" style="width:125px">
                                                <option value="0" {{ if eq .AccLevel 0 }}selected="selected"{{ end }}>No Access</option>
                                                <option value="80" {{ if eq .AccLevel 80 }}selected="selected"{{ end }}>Restricted</option>
                                                <option value="100" {{ if eq .AccLevel 100 }}selected="selected"{{ end }}>Administrator</option>
                                            </select></td>
                                        <td>
                                            <div class="form-group form-check">
                                                <input type="checkbox" name="{{ .Username}}_delete" class="form-check-input" value="1">
                                            </div>
                                        </td>
                                    </tr>
                                {{ end }}
                                <tr>
                                    <th scope="row">new</th>
                                    <td><input type="text" name="new_username" class="form-control"
                                               id="exampleInputPassword1"></td>
                                    <td><input type="password" name="new_password" class="form-control"
                                               id="exampleInputPassword1"></td>
                                    <td><select name="new_acclevel" style="width:125px">
                                            <option value="0" selected="selected">No Access</option>
                                            <option value="80">Restricted</option>
                                            <option value="100">Administrator</option>
                                        </select></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
            </div>
        </div>
    </div>
</div>
{{ template "base/footer" . }}