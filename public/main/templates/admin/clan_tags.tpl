{{ $root := . }}
{{ template "admin/base/head" . }}
{{ template "base/flash" .flash }}
<div class="my-3 p-3 bg-white rounded shadow-sm">

    Special characters in the pattern:<p>

    <table border=0 cellspacing=0 cellpadding=4>

        <tr class="head">
            <td class="fSmall">Character</td>
            <td class="fSmall">Description</td>
        </tr>

        <tr>
            <td class="fNormal"><tt>A</tt></td>
            <td class="fNormal">Matches one character  (i.e. a character is required)</td>
        </tr>

        <tr>
            <td class="fNormal"><tt>X</tt></td>
            <td class="fNormal">Matches zero or one characters  (i.e. a character is optional)</td>
        </tr>

        <tr>
            <td class="fNormal"><tt>a</tt></td>
            <td class="fNormal">Matches literal A or a</td>
        </tr>

        <tr>
            <td class="fNormal"><tt>x</tt></td>
            <td class="fNormal">Matches literal X or x</td>
        </tr>

    </table><p>

        Example patterns:<p>

    <table border=0 cellspacing=0 cellpadding=4>

        <tr class="head">
            <td class="fSmall">Pattern</td>
            <td class="fSmall">Description</td>
            <td class="fSmall">Example</td>
        </tr>

        <tr>
            <td class="fNormal"><tt>[AXXXXX]</tt></td>
            <td class="fNormal">Matches 1 to 6 characters inside square braces</td>
            <td class="fNormal"><tt>[ZOOM]Player</tt></td>
        </tr>

        <tr>
            <td class="fNormal"><tt>{AAXX}</tt></td>
            <td class="fNormal">Matches 2 to 4 characters inside curly braces</td>
            <td class="fNormal"><tt>{S3G}Player</tt></td>
        </tr>

        <tr>
            <td class="fNormal"><tt>rex>></tt></td>
            <td class="fNormal">Matches the string "rex>>", "REX>>", etc.</td>
            <td class="fNormal"><tt>REX>>Tyranno</tt></td>
        </tr>

    </table><p>

        Avoid adding patterns to the database that are too generic. Always ensure you have at least one literal (non-special) character in the pattern -- for example if you were to add the pattern "AXXA", it would match any player with 2 or more letters in their name!<p>

        The Match Position field sets which end of the player's name the clan tag is allowed to appear.<p>

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