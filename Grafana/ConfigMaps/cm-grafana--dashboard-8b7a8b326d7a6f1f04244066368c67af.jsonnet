
local data = import "../Dashboards/k8s/Kubernetes _ Networking _ Namespace (Pods).json";

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

    name: "grafana--dashboard-8b7a8b326d7a6f1f04244066368c67af",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---networking---namespace--pods-.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

