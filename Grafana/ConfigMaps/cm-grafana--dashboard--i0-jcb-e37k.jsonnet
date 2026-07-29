
local data = import "../Dashboards/k8s/USE Method _ Node.json";

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

    name: "grafana--dashboard--i0-jcb-e37k",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "use-method---node.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

