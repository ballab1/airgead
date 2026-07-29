
local data = import "../Dashboards/bobb/Category Spending.json";

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

    name: "grafana--dashboard-bof9wz2",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "category-spending.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

