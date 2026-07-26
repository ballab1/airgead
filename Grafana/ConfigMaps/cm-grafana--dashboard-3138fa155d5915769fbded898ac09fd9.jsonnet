
local data = import "../Dashboards/k8s/Kubernetes _ Kubelet.json";

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

    name: "grafana--dashboard-3138fa155d5915769fbded898ac09fd9",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---kubelet.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

