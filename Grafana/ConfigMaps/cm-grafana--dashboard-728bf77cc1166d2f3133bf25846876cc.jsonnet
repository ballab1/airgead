
local data = import "../Dashboards/k8s/Kubernetes _ Networking _ Workload.json";

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

    name: "grafana--dashboard-728bf77cc1166d2f3133bf25846876cc",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---networking---workload.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

