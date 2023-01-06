{{/*
Get redis addr
*/}}
{{- define "casperparser.redis.addr" -}}
{{- if .Values.redisOverride -}}
{{- .Values.redisOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
casperparser-redis-service-{{ .Values.casperNetwork }}:{{ .Values.redis.containerPort }}
{{- end -}}
{{- end -}}

{{/*
Get postgres addr
*/}}
{{- define "casperparser.postgres.addr" -}}
{{- if .Values.postgresOverride -}}
{{- .Values.postgresOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
postgres://postgres@casperparser-db-service-{{ .Values.casperNetwork }}:{{ .Values.postgres.containerPort }}/casperparser-{{ .Values.casperNetwork }}
{{- end -}}
{{- end -}}