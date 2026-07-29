
local data = import "../Dashboards/k8s/Kubernetes _ Proxy.json";

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

    name: "grafana--dashboard-632e265de029684c40b21cb76bca4f94",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---proxy.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

