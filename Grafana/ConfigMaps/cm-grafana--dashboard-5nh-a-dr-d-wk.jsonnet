
local data = import "../Dashboards/kafka/kafka Metrics.json";

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

    name: "grafana--dashboard-5nh-a-dr-d-wk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kafka-metrics.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

