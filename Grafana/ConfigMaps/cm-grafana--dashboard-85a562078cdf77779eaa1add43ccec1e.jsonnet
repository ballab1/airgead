
local data = import "../Dashboards/k8s/Kubernetes _ Compute Resources _ Namespace (Pods).json";

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

    name: "grafana--dashboard-85a562078cdf77779eaa1add43ccec1e",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "kubernetes---compute-resources---namespace--pods-.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

