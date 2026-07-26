
local data = import "../Dashboards/k8s/USE Method _ Cluster.json";

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

    name: "grafana--dashboard-9o0cb-e3nk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "use-method---cluster.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

