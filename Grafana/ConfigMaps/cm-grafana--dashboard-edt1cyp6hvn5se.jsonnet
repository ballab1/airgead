
local data = import "../Dashboards/bobb/Financial Summary.json";

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

    name: "grafana--dashboard-edt1cyp6hvn5se",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "financial-summary.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

