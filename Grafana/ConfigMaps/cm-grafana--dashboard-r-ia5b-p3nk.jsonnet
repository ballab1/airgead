
local data = import "../Dashboards/k8s/Prometheus _ Overview.json";

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

    name: "grafana--dashboard-r-ia5b-p3nk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "prometheus---overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

