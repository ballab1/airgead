
local data = import "../Dashboards/kafka/kafka Exporter Overview.json";

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

    name: "grafana--dashboard-jw-p-k-isniz",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kafka-exporter-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

