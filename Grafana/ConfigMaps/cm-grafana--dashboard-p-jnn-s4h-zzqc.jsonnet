
local data = import "../Dashboards/minio/MinIO Object Storage.json";

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

    name: "grafana--dashboard-p-jnn-s4h-zzqc",
    namespace: 'grafana-ge-stg',
  },
  data: {
    "minio-object-storage.json": data,
  },

};
[ cfgmap(std.toString(data)) ]

