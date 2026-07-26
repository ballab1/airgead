
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Node (Pods).json";

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

    name: "grafana--dashboard-200ac8fdbfbb74b39aff88118e4d1c2c",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---node--pods-.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

