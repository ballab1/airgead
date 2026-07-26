
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Cluster.json";

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

    name: "grafana--dashboard-efa86fd1d0c121a26444b636a3f509a8",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---cluster.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

