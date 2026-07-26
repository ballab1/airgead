
local data = import "../Dashboards/jenkins/Jenkins: Performance and Health Overview.json";

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

    name: "grafana--dashboard-haryan-jenkins",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "jenkins--performance-and-health-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

