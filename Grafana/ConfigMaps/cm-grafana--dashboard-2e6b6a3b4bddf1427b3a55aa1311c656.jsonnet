
local data = import "../Dashboards/k8s/Kubernetes _ Scheduler.json";

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

    name: "grafana--dashboard-2e6b6a3b4bddf1427b3a55aa1311c656",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---scheduler.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

