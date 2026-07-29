
local data = import "../Dashboards/kafka/kafka core overview.json";

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

    name: "grafana--dashboard--r6z113--7k",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kafka-core-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

