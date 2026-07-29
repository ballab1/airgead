
local data = import "../Dashboards/jenkins/Jenkins Exporter Summary.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "jenkins",
    },

    name: "grafana--dashboard-fa-z-j-w-r-s-wk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "jenkins-exporter-summary.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

