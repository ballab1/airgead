
local data = import "../Dashboards/bobb/Travel Summary.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "bobb",
    },

    name: "grafana--dashboard-bo874g4",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "travel-summary.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

