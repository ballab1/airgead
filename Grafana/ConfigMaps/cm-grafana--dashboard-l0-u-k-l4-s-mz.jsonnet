
local data = import "../Dashboards/kafka/kafka Overview.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "kafka",
    },

    name: "grafana--dashboard-l0-u-k-l4-s-mz",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kafka-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

