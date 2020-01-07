{{ template "base/head" . }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table table-striped" >
        <thead>
        <tr>
            <th scope="col" style="width:5%;">Rank</th>
            <th scope="col" style="width:30%;">
                <a href="{{ sortRow .URL "lastName" }}" class="head" title="Change sorting order">Игрок</a>
                {{ if isEnabledSorting .URL "lastName" }} {{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "skill" }}" title="Change sorting order">Опыт</a>
                {{ if isEnabledSorting .URL "skill" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:10%;">Активность</th>
            <th scope="col" style="width:10%;">
                <a href="{{ sortRow .URL "connection_time" }}" title="Change sorting order">Время игры</a>
                {{ if isEnabledSorting .URL "connection_time" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "kills" }}" title="Change sorting order">Фраги</a>
                {{ if isEnabledSorting .URL "kills" }} {{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:7%;">
                <a href="{{ sortRow .URL "deaths" }}" title="Change sorting order">Смерти</a>
                {{ if isEnabledSorting .URL "deaths" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:6%;">
                <a href="{{ sortRow .URL "kpd" }}" title="Change sorting order">Ф:C</a>
                {{ if isEnabledSorting .URL "kpd" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:6%;">
                <a href="{{ sortRow .URL "headshots" }}" title="Change sorting order">Хедшоты</a>
                {{ if isEnabledSorting .URL "headshots" }} {{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:6%;">
                <a href="{{ sortRow .URL "hpk" }}" title="Change sorting order">Х:Ф</a>
                {{ if isEnabledSorting .URL "hpk" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
            <th scope="col" style="width:6%;">
                <a href="{{ sortRow .URL "acc" }}" title="Change sorting order">Точность</a>
                {{ if isEnabledSorting .URL "acc" }}{{ template "help/sort_image" . }}{{ end }}
            </th>
        </tr>
        </thead>
        <tbody>
        {{ range $i, $s := .players }}
            <tr>
                <td>{{ Inc $i }}</td>
                <td><a href="/player/{{ .ID }}"><img
                                src="/public/hlstatsimg/flags/{{ GetFlag .Flag }}.gif" class="tableicon"
                                alt="Russian federation"
                                title="Russian federation"/><b>{{ .LastName }}</b></a></td>
                <td>{{ .Skill }} <img src="/public/hlstatsimg/t0.gif"
                                      alt="3202 Points"/></td>
                <td>{{ BarGraph .Activity }}</td>
                <td>{{ .ConnectionTime }}</td>
                <td>{{ .Kills }}</td>
                <td>{{ .Deaths }}</td>
                <td>{{ .Kpd.Value }}</td>
                <td>{{ .HeadShots }}</td>
                <td>{{ .Hpk.Value }}</td>
                <td>0.0%</td>
            </tr>
        {{ end }}
        </tbody>
    </table>
    {{ template "help/pagination" . }}
</div>
{{ template "base/footer" . }}