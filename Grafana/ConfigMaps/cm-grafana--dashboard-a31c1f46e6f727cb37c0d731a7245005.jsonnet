
local data = import "../Dashboards/k8s/Kubernetes _ StatefulSets.json";

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

    name: "grafana--dashboard-a31c1f46e6f727cb37c0d731a7245005",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---statefulsets.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

