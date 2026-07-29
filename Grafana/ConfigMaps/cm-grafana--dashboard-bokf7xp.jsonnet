
local data = import "../Dashboards/bobb/Tax Spending.json";

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

    name: "grafana--dashboard-bokf7xp",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "tax-spending.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

