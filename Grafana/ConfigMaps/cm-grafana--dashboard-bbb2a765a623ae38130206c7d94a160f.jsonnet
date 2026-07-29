
local data = import "../Dashboards/k8s/Kubernetes _ Networking _ Namespace (Workload).json";

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

    name: "grafana--dashboard-bbb2a765a623ae38130206c7d94a160f",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---networking---namespace--workload-.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

