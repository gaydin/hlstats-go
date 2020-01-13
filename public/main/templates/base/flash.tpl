{{ if . }}
    {{ if eq .Type 1 }}
        <ol class="alert alert-success">
            {{  .Message }}
        </ol>
    {{ end }}
    {{ if eq .Type  2 }}
        <ol class="alert alert-danger">
            {{  .Message }}
        </ol>
    {{ end }}
    {{ if eq .Type  3 }}
        <ol class="alert alert-info">
            {{  .Message }}
        </ol>
    {{ end }}
{{ end }}