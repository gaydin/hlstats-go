{{ $url := .URL }}
<div class="row align-items-center">
    <div class="col-sm-6 text-left">
        <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
            <ul class="pagination">
                <li class="paginate_button page-item previous {{ if not .pagination.HasPrevious }}disabled{{ end }}"
                    id="DataTables_Table_0_previous">
                    <a href="{{ $url.Path }}?page={{  .pagination.Previous }}"
                       aria-controls="DataTables_Table_0"
                       data-dt-idx="0"
                       tabindex="0"
                       class="page-link">Prev</a>
                </li>
                {{ range $i, $v := .pagination.Pages }}
                    {{ if ne $v.Num -1 }}
                        <li class="paginate_button page-item {{ if  $v.IsCurrent }}active{{ end }}">
                            <a href="{{ $url.Path }}?page={{ $v.Num }}"
                               aria-controls="DataTables_Table_0"
                               data-dt-idx="1"
                               tabindex="0"
                               class="page-link">{{ $v.Num }}</a></li>
                    {{ end }}
                {{ end }}
                <li class="paginate_button page-item next {{ if not .pagination.HasNext }}disabled{{ end }}"
                    id="DataTables_Table_0_next">
                    <a href="{{ $url.Path }}?page={{ .pagination.Next }}"
                       aria-controls="DataTables_Table_0"
                       data-dt-idx="3"
                       tabindex="0"
                       class="page-link">Next</a>
                </li>
            </ul>
        </div>
    </div>
</div>