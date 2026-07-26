
local data = import "../Dashboards/k8s/Kubernetes _ Networking _ Pod.json";

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

    name: "grafana--dashboard-7a18067ce943a40ae25454675c19ff5c",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---networking---pod.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

