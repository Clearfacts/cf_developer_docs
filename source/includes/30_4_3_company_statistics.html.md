## Query - Company Statistics

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query statistics {
  getCompanyStatistics (type: "AIR", startPeriod: "2025-01-01", endPeriod: "2025-12-31") {
    companyNumber,
    items {
      period,
      value
    }
  }
}
```

```json
{
  "data": {
    "getCompanyStatistics": [
      {
        "companyNumber": "BE0123123123",
        "items": [
          {
            "period": "01/2025",
            "value": 5
          }
        ]
      }
    ]
  }
}
```

This queries the company statistics of a specific administration the user has access to.
<br/>
The main argument is the `type` of statistics you want to retrieve:

* AIR: (Automatic Invoice Recognition) how many invoices were recognised by our text recognition system
* processing: how many documents were processed through ClearFacts, into the accountant software

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a list of [CompanyStatistic](https://assets-prod.cdn.clearfacts.be/doc/companystatistic.doc.html) objects.
One entry per administration, with a list of items, one per "month/year" period.
