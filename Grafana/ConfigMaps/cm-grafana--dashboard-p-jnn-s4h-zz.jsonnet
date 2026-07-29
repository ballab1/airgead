
local data = import "../Dashboards/minio/Minio Overview.json";

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

    name: "grafana--dashboard-p-jnn-s4h-zz",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "minio-overview.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

