

-- Table: quicken_data

DROP TABLE IF EXISTS quicken_data;
CREATE TABLE IF NOT EXISTS quicken_data
(
    id SERIAL PRIMARY KEY,
    "date" character varying,
    account character varying,
    num character varying,
    description character varying,
    memo character varying,
    category character varying,
    tag character varying,
    tax_item character varying,
    clr character varying,
    amount character varying
);
ALTER TABLE IF EXISTS quicken_data OWNER to postgres;


#!/bin/bash

FILE=~/20251231-quicken.csv

KUBECTL='/snap/bin/kubectl'
POD="$("$KUBECTL" get pods -n postgres -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')"
"$KUBECTL" cp "$FILE" "postgres/${POD}:/tmp/transactions.csv"
"$KUBECTL" exec -n postgres "${POD}" -- chmod 666 /tmp/transactions.csv
"$KUBECTL" exec -n postgres "${POD}" -- psql -U bobb -h localhost -d money -c "truncate quicken_data"
"$KUBECTL" exec -n postgres "${POD}" -- psql -U bobb -h localhost -d money -c "copy quicken_data from '/tmp/transactions.csv' header csv"
"$KUBECTL" exec -n postgres "${POD}" -- rm /tmp/transactions.csv

