
local data = import "../Dashboards/jenkins/Jenkins overview.json";

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

    name: "grafana--dashboard-aj5--idr-ik",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "jenkins-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

