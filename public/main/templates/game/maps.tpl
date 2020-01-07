{{ template "base/head" . }}

{{ $game := .game }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Rank</th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "map" }}" title="Change sorting order">Карта</a>
                {{ if isEnabledSorting .URL "map" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "kills" }}" title="Change sorting order">Убийства</a>
                {{ if isEnabledSorting .URL "kills" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col">%</th>
            <th scope="col">Ratio</th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "headshots" }}" title="Change sorting order">Headshots</a>
                {{ if isEnabledSorting .URL "headshots" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col">%</th>
            <th scope="col">Ratio</th>
          <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "hpk" }}" title="Change sorting order">HS:K</a>
                {{ if isEnabledSorting .URL "hpk" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
        </tr>
        </thead>
        <tbody>
        {{ range $i, $w := .maps }}
            <tr>
                <td>{{ Inc $i }}</td>
                <td><a href="/game/{{ $game }}/maps/{{ .Name }}">{{ .Name }}</a></td>
                <td>{{ .Kills }}</td>
                <td>{{ .Kpercent.Value }}</td>
                <td>{{ BarGraph .Kpercent.Value }}</td>
                <td>{{ .Headshots }}</td>
                <td>{{ .Hpercent.Value }}</td>
                <td>{{ BarGraph .Hpercent.Value }}</td>
                <td>{{ .HPK.Value }}</td>
            </tr>
        {{ end }}
        </tbody>
    </table>
</div>
{{ template "base/footer" . }}