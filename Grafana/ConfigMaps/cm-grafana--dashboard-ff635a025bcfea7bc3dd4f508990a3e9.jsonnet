
local data = import "../Dashboards/k8s/Kubernetes _ Networking _ Cluster.json";

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

    name: "grafana--dashboard-ff635a025bcfea7bc3dd4f508990a3e9",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---networking---cluster.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

