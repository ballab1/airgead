
local data = import "../Dashboards/bobb/Funds in each Bank.json";

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

    name: "grafana--dashboard-adtcxci3kg5j4c",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "funds-in-each-bank.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

