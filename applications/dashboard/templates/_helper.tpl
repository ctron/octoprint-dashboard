{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "octoprint-dashboard.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "octoprint-dashboard.labels" }}
{{ include "octoprint-dashboard.selectorLabels" . }}
{{- if .root.Chart.AppVersion }}
app.kubernetes.io/version: {{ .root.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .root.Release.Service }}
{{- end }}

{{- define "octoprint-dashboard.selectorLabels" }}
app.kubernetes.io/name: {{ .name }}
app.kubernetes.io/component: {{ .component }}
app.kubernetes.io/instance: {{ .root.Values.coreReleaseName | default .root.Release.Name }}
{{- end }}
