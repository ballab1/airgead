
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Namespace (Workloads).json";

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

    name: "grafana--dashboard-a87fb0d919ec0ea5f6543124e16c42a5",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---namespace--workloads-.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

