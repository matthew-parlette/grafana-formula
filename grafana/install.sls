# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "grafana/map.jinja" import grafana with context %}

grafana-image:
  dockerng.image_present:
    - name: {{ grafana.image }}
    - force: True
