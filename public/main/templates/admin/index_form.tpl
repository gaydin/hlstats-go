{{ $option := . }}
{{ if eq .Type "select" }}
    <select name="{{ $option.Key }}" style="width: 226px">"
    {{ range $index, $element := .OptionChoices }}
        {{ if eq $element.Value $option.Value }}
            <option value="{{ $element.Value }}" selected="selected">{{ $element.Text }}
        {{ else }}
            <option value="{{ $element.Value }}">{{ $element.Text }}
        {{ end }}
    {{ end }}
    </select>
{{ else }}
    <input type="text" name="{{ .Key }}" size="35" value="{{ .Value }}" class="textbox" maxlength="255"/>
{{ end }}