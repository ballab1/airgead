
local data = import "../Dashboards/minio/Minio dash.json";

local cfgmap(data) = {
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    labels: {
      "grafana_dashboard": "1",
    },
    annotations: {
      "dashboard_folder": "minio",
    },

    name: "grafana--dashboard-fe0dj5wj4k6wwd",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "minio-dash.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

