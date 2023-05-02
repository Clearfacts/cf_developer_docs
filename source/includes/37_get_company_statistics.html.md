## Query the statistics of a company

```graphql
query statistics ($type: String!, $startPeriod: Date!, $endPeriod: Date!) {
  getCompanyStatistics(type: $type, startPeriod: $startPeriod, endPeriod: $endPeriod) {
    companyNumber
    items {
      period
      value
    }
  }
}
```

> The variables:

```json
{
  "type": "AIR",
  "startPeriod": "2015-01-18",
  "endPeriod": "2018-07-18"
}
```

> this will fetch the statistics of AIR usage:

```json
{
  "data": {
    "getCompanyStatistics": [
      {
        "companyNumber": "BE0123123123",
        "items": [
          {
            "period": "06/2018",
            "value": 3
          }
        ]
      }
    ]
  }
}
```

This example queries the statistics of AIR usage.

The getCompanyStatistics supports multiple types, each will have a set of usable parameters.

#####Types:
- AIR:
    * startPeriod
    * endPeriod
    * companyNumber
- Processing:
    * startPeriod
    * endPeriod
    * companyNumber
    * invoiceType
    * worklist

#####Parameters:
- startPeriod: An RFC-3339 encoded date string. This field is required.
- endPeriod: An RFC-3339 encoded date string. This field is required.
- companyNumber: Company number of the administration whose statistics you want to query. This field is optional. (e.g. BE0123456789)
- invoicetype: Filter statistics based on invoicetype. The invoicetype has to be one of the following: "SALE" or "PURCHASE". This field is
optional.
- worklist: If true, query statistics for documents processed through worklist. If false, query statistics for documents not processed through
worklist. This field is optional. By default, statistics for all documents are returned.

If you'd like to test the example above, you can use this link to the GraphQL Playground:
[https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-023fdc83-f192-4fc5-ab5f-17c761e0dc09](https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-023fdc83-f192-4fc5-ab5f-17c761e0dc09)
