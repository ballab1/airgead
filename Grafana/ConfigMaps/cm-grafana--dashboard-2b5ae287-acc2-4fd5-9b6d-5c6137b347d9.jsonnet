
local data = import "../Dashboards/bobb/Transactions.json";

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

    name: "grafana--dashboard-2b5ae287-acc2-4fd5-9b6d-5c6137b347d9",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "transactions.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

