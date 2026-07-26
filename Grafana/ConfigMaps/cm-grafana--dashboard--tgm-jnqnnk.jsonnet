
local data = import "../Dashboards/minio/MinIO Dashboard.json";

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

    name: "grafana--dashboard--tgm-jnqnnk",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "minio-dashboard.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

