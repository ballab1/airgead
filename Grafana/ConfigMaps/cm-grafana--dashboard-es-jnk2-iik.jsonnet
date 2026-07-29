
local data = import "../Dashboards/jenkins/Jenkins Dashboard.json";

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

    name: "grafana--dashboard-es-jnk2-iik",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "jenkins-dashboard.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

