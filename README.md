# RedshiftSupplyCollector
A supply collector designed to connect to AWS Redshift

## Building
Run `dotnet build`

## Testing
1) Create a redshift cluster
![Create cluster](/docs/create_cluster.png?raw=true)

2) Load data to database
Open query editor and execute sql script to fill test data: [data.sql](RedshiftSupplyCollectorTests/tests/data.sql?raw=true)
Run statements one by one, Query Editor doesn't support running scripts with multiple statements at once.
![Load data](/docs/load_data.png?raw=true)

3) Run test script passing credentials as command-line arguments
`./run-tests.sh --host redshift-cluster-1.cp5amaceqv1g.us-east-1.redshift.amazonaws.com --port 5439 --db dev --user awsuser --pass awspass`


