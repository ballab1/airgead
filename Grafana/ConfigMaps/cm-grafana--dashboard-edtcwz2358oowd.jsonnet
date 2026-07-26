
local data = import "../Dashboards/bobb/Individual Managed Funds.json";

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

    name: "grafana--dashboard-edtcwz2358oowd",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "individual-managed-funds.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

