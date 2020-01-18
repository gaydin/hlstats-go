{{ $root := . }}
{{ template "admin/base/head" . }}
{{ template "base/flash" .flash }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <form method="post" action="/admin/voicecomm">
        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Server Name</th>
                <th scope="col">Server IP or Hostname</th>
                <th scope="col">Password</th>
                <th scope="col">UDP Port (TS only)</th>
                <th scope="col">Query Port (TS)/Connect Port (Vent)</th>
                <th scope="col">Notes</th>
                <th scope="col">Server Type</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            {{ range $i, $server := .voice_servers }}
                <tr>
                    <th scope="row"></th>
                    <th scope="row">
                        <input type="hidden" name="rows[]" value="{{ $server.ID }}"/>
                        <input type="text" name="{{ $server.ID }}_name" class="form-control" value="{{ $server.Name }}">
                    </th>
                    <th scope="row"><input type="text" name="{{ $server.ID }}_addr" class="form-control"
                                           value="{{ $server.Addr }}"></th>
                    <th scope="row"><input type="text" name="{{ $server.ID }}_password" class="form-control"
                                           value="{{ $server.Password.String }}"></th>
                    <th scope="row"><input type="text" name="{{ $server.ID }}_port" class="form-control"
                                           value="{{ $server.UDPPort }}"></th>
                    <th scope="row"><input type="text" name="{{ $server.ID }}_query_port" class="form-control"
                                           value="{{ $server.QueryPort }}"></th>
                    <th scope="row"><input type="text" name="{{ $server.ID }}_descr" class="form-control"
                                           value="{{ $server.Descr.String }}"></th>
                    <th scope="row">
                        <select name="{{ $server.ID }}_type" class="custom-select">
                            <option value="0" {{ if eq $server.Type 0 }}selected="selected"{{ end }}>
                                Teamspeak
                            </option>
                            <option value="1" {{ if eq $server.Type 1 }}selected="selected"{{ end }}>
                                Ventrilo
                            </option>
                        </select>
                    </th>
                    <th scope="row">
                        <div class="form-group form-check">
                            <input type="checkbox" name="{{ .ID}}_delete" class="form-check-input"
                                   value="1">
                        </div>
                    </th>
                </tr>
            {{ end }}
            <tr>
                <th scope="row">New server</th>
                <th scope="row"><input type="hidden" name="rows[]" value="new"/><input type="text" name="new_name"
                                                                                       class="form-control" value="">
                </th>
                <th scope="row"><input type="text" name="new_addr" class="form-control"></th>
                <th scope="row"><input type="text" name="new_password" class="form-control"></th>
                <th scope="row"><input type="text" name="new_port" class="form-control" value="8767"></th>
                <th scope="row"><input type="text" name="new_query_port" class="form-control" value="51234"></th>
                <th scope="row"><input type="text" name="new_descr" class="form-control"></th>
                <th scope="row"><select name="new_type" class="custom-select">
                        <option value="0">
                            Teamspeak
                        </option>
                        <option value="1">
                            Ventrilo
                        </option>
                    </select>
                </th>
                </th>
                <th scope="row"></th>
            </tr>
            </tbody>
        </table>
        <hr>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{{ template "admin/base/footer" . }}