{{ template "base/head" . }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Rank</th>
            <th scope="col"><a href="{{ sortRow .URL "weapon" }}" title="Change sorting order">Weapon</a>
                {{ if isEnabledSorting .URL "weapon" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col"><a href="{{ sortRow .URL "modifier" }}" title="Change sorting order">Modifier</a>
                {{ if isEnabledSorting .URL "modifier" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col"><a href="{{ sortRow .URL "kills" }}" title="Change sorting order">Kills</a>
                {{ if isEnabledSorting .URL "kills" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col">%</th>
            <th scope="col">Ratio</th>
            <th scope="col"><a href="{{ sortRow .URL "headshots" }}" title="Change sorting order">Headshots</a>
                {{ if isEnabledSorting .URL "headshots" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col">%</th>
            <th scope="col">Ratio</th>
            <th scope="col"><a href="{{ sortRow .URL "hpk" }}" title="Change sorting order">HS:K</a>
                {{ if isEnabledSorting .URL "hpk" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
        </tr>
        </thead>
        <tbody>
        {{ range $i, $w := .weapons }}
            <tr>
                <td style="text-align:right;">{{ Inc $i }}</td>
                <td style="text-align:right;">{{ .Name }}</td>
                <td style="text-align:right;">{{ .Modifier }}</td>
                <td style="text-align:right;">{{ .Kills }}</td>
                <td style="text-align:right;">{{ .Kpercent.Value }}</td>
                <td style="text-align:right;">{{ BarGraph .Kpercent.Value }}</td>
                <td style="text-align:right;">{{ .Headshots }}</td>
                <td style="text-align:right;">{{ .Hpercent.Value }}</td>
                <td style="text-align:right;">{{ BarGraph .Hpercent.Value }}</td>
                <td style="text-align:right;">{{ .HPK.Value }}</td>
            </tr>
        {{ end }}
        </tbody>
    </table>
</div>
{{ template "base/footer" . }}