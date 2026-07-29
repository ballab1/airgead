
local data = import "../Dashboards/k8s/Nodes.json";

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

    name: "grafana--dashboard--o-l05b-pqnk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "nodes.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

