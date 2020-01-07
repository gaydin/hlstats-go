{{ template "base/head" . }}
<div class="my-3 p-3 bg-white rounded shadow-sm">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Rank</th>
            <th scope="col">Action</th>
            <th scope="col">Earned</th>
            <th scope="col">Reward</th>
        </tr>
        </thead>
        <tbody>
        {{range  $i, $a := .actions }}
            <tr>
                <td>{{ Inc $i }}</td>
                <td>{{ $a.Description }}</td>
                <td>{{ $a.Count }}</td>
                <td>{{ $a.RewardPlayer }}</td>
            </tr>
        {{ end }}
        </tbody>
    </table>
</div>
{{ template "base/footer" . }}