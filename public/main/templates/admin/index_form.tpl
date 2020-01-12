{{ $option := . }}
{{ if eq .Type "select" }}
    <select name="{{ $option.Key }}" class="custom-select" id="{{ .Key }}">"
        {{ range $index, $element := .OptionChoices }}
        {{ if eq $element.Value $option.Value }}
        <option value="{{ $element.Value }}" selected="selected">{{ $element.Text }}
            {{ else }}
        <option value="{{ $element.Value }}">{{ $element.Text }}
            {{ end }}
            {{ end }}
    </select>
{{ else }}
    <input type="text" name="{{ .Key }}" size="35" value="{{ .Value }}" id="{{ .Key }}" class="form-control"
           maxlength="255"/>
{{ end }}