
local data = import "../Dashboards/bobb/CD Ladder.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "bobb",
    },

    name: "grafana--dashboard-75d097a9-d7ca-428f-88b7-ec09103f30b6",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "cd-ladder.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

