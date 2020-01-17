
<div class="my-3 p-3 bg-white rounded shadow-sm">
    Statistics Summary

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Activity</label>
        </div>
        <div class="col-md-8 col-6">
            Полоска
        </div>
        <div class="col-md-8 col-6">
            (Not Specified)
        </div>
    </div>


    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Points</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Skill }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Rank</label>
        </div>
        <div class="col-md-8 col-6">
            TODO
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Kills per Minute</label>
        </div>
        <div class="col-md-8 col-6">
            {{ if gt .player.ConnectionTime 0 }}
                {{ .killsPerMinute }}
            {{ else }}
                -
            {{ end }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Kills per Death</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Kpd.Float64 }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Headshots per Kill</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Hpk.Float64 }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Shots per Kill</label>
        </div>
        <div class="col-md-8 col-6">
            TODO
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Weapon Accuracy</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Acc.Float64 }}%
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Headshots</label>
        </div>
        <div class="col-md-8 col-6">
            {{ if eq .player.Headshots 0 }}
                TODO: realheadshots
            {{ else }}
                {{ .player.Headshots }}
            {{ end }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Kills</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Kills }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Deaths</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Deaths }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Longest Kill Streak</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.KillStreak }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Longest Death Streak</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.DeathStreak }}
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Suicides</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.Suicides }}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4 col-md-3 col-6">
            <label>Teammate Kills</label>
        </div>
        <div class="col-md-8 col-6">
            {{ .player.TeamKills }}
        </div>
    </div>
    <br/>
</div>