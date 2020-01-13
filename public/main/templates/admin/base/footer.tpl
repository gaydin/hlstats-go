        </div><!-- #content  -->
    </div><!-- .wrapper  -->

</div> <!-- .page-content -->

{{/*<script src="/public/js/jquery-3.3.1.slim.min.js"></script>*/}}
<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/public/js/chart.min.js"></script>
{{/*<script src="/public/js/bootstrap.bundle.min.js"></script>*/}}
<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('.sidebar').toggleClass('active');
            $('.sidebar').toggleClass('col-md-3');
            $('.sidebar').toggleClass('col-md-1');
            $('#content').toggleClass('col-md-9');
            $('#content').toggleClass('col-md-11');
        });
    });
</script>
</body>
</html>