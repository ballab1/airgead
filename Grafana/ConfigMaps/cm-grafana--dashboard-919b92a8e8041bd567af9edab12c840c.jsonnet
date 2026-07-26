
local data = import "../Dashboards/k8s/Kubernetes _ Persistent Volumes.json";

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

    name: "grafana--dashboard-919b92a8e8041bd567af9edab12c840c",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---persistent-volumes.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

