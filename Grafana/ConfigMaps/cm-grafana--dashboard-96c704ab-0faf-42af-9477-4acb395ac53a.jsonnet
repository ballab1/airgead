
local data = import "../Dashboards/bobb/Weath Categories.json";

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

    name: "grafana--dashboard-96c704ab-0faf-42af-9477-4acb395ac53a",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "weath-categories.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

