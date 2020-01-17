{{ template "base/head" . }}
<div class="row justify-content-center">
    <div class="col-sm-3">
        <div class="my-3 p-3 bg-white rounded shadow-sm">
            {{ template "player/player_info" . }}
        </div>
        <div class="my-3 p-3 bg-white rounded shadow-sm">
            График изменения рейтинга
            <canvas id="canvas"></canvas>
        </div>
    </div>
    <div class="col-sm-4">
        {{ template "player/player_summary" . }}
    </div>
</div>

<script>
    var config = {
        type: 'line',
        data: {{ .chartData }},
        options: {
            responsive: true,
            hoverMode: 'index',
            stacked: false,
            scales: {
                yAxes: [{
                    type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                    display: true,
                    position: 'left',
                    id: 'y-axis-1',
                }, {
                    type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                    display: true,
                    position: 'right',
                    id: 'y-axis-2',

                    // grid line settings
                    gridLines: {
                        drawOnChartArea: false, // only want the grid lines for one axis to show up
                    },
                }],
            }
        }
    };

    window.onload = function () {
        var ctx = document.getElementById('canvas').getContext('2d');
        window.myLine = new Chart(ctx, config);
    };
</script>
{{ template "base/footer" . }}