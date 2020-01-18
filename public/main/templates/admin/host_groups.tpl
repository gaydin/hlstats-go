{{ $root := . }}
{{ template "admin/base/head" . }}
{{ template "base/flash" .flash }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    Host Groups allow you to group, for example, all players from "...adsl.someisp.net" as "SomeISP ADSL", in the Host Statistics admin tool.<p>

        The Host Pattern should look like the <b>end</b> of the hostname. For example a pattern ".adsl.someisp.net" will match "1234.ny.adsl.someisp.net". You can use asterisks "*" in the pattern, e.g. ".ny.*.someisp.net". The asterisk matches zero or more of any character except a dot ".".<p>

        The patterns are sorted below in the order they will be applied. A more specific pattern should match before a less specific pattern.<p>

        <b>Note</b> Run <b>hlstats-resolve.pl --regroup</b> to apply grouping changes to existing data.<p>
</div>
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <form method="post" action="/admin/clantags">
        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Pattern</th>
                <th scope="col">Match Position</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            {{ range $i, $clan_tag := .clan_tags }}
                <tr>
                    <th scope="row">
                        <img src="/public/hlstatsimg/clan.gif" width="16" height="16" border="0" alt="">
                    </th>
                    <td>
                        <input type="hidden" name="rows[]" value="{{ $clan_tag.ID }}"/>
                        <input type="text" name="{{ $clan_tag.ID }}_name" class="form-control" value="{{ $clan_tag.Pattern }}">
                    </td>
                    <td>
                        <select name="{{ $clan_tag.ID }}_position" class="custom-select">
                            <option value="EITHER" {{ if eq $clan_tag.Position "EITHER" }}selected="selected"{{ end }}>
                                EITHER
                            </option>
                            <option value="START" {{ if eq $clan_tag.Position "START" }}selected="selected"{{ end }}>
                                START only
                            </option>
                            <option value="END" {{ if eq $clan_tag.Position "END" }}selected="selected"{{ end }}>
                                END only
                            </option>
                        </select>
                    </td>
                    <td>
                        <div class="form-group form-check">
                            <input type="checkbox" name="{{ $clan_tag.ID }}_delete" class="form-check-input" value="1">
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