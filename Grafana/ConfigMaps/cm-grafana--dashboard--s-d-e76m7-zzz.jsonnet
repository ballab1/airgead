
local data = import "../Dashboards/kafka/ZooKeeper by Prometheus.json";

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

    name: "grafana--dashboard--s-d-e76m7-zzz",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "zookeeper-by-prometheus.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

