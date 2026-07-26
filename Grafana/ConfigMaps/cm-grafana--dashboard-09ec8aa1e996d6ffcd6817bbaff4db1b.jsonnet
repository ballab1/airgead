
local data = import "../Dashboards/k8s/Kubernetes _ API server.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "k8s",
    },

    name: "grafana--dashboard-09ec8aa1e996d6ffcd6817bbaff4db1b",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---api-server.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

