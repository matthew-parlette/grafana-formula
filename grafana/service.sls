# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "grafana/map.jinja" import grafana with context %}

include:
  - grafana.install

grafana-container:
  dockerng.running:
    - name: {{ grafana.name }}
    - image: {{ grafana.image }}
    - port_bindings:
      - {{ grafana.port }}:3000
    {%- if grafana.has_key('environment') %}
    - environment:
      {%- for setting, value in grafana.environment.iteritems() %}
      - {{ setting }}: {{ value }}
      {%- endfor %}
    {%- endif %}
    - require:
      - dockerng: grafana-image
