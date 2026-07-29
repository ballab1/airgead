
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Pod.json";

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

    name: "grafana--dashboard-6581e46e4e5c7ba40a07646395ef7b23",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---pod.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

