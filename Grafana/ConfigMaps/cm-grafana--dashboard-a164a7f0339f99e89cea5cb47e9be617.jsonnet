
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Workload.json";

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

    name: "grafana--dashboard-a164a7f0339f99e89cea5cb47e9be617",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---workload.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

