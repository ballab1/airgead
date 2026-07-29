
local data = import "../Dashboards/k8s/Kubernetes _ Controller Manager.json";

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

    name: "grafana--dashboard-72e0e05bef5099e5f049b05fdc429ed4",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---controller-manager.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

