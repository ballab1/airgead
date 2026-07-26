
local data = import "../Dashboards/k8s/Prometheus _ Remote Write.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "k8s",
    },

    name: "grafana--dashboard-9w-acx-eqnk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "prometheus---remote-write.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

