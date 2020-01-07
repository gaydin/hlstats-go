{{ template "base/head" . }}
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Rank</th>
        <th scope="col">Player</th>
        <th scope="col">Kills on MAPTODO</th>
        <th scope="col">Headshots</th>
        <th scope="col">Hpk</th>
    </tr>
    </thead>
    <tbody>
    {{ range $i, $v := .data }}
        <tr>
            <td >{{ $i }}</td>
            <td >{{ .LastName }}</td>
            <td >{{ .Frags }}</td>
            <td >{{ .HeadShots }}</td>
            <td >{{ .HPK }}</td>
        </tr>
    {{ end }}
    </tbody>
</table>

{{ template "base/footer" . }}