## Query - Customers

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query customers {
  customers (companyNumber: "0123123123") {
    id,
    name
  }
}
```

```json
{
  "data": {
    "customers": [
      {
        "id": "ACME",
        "name": "Acme Corporation"
      }
    ]
  }
}
```

This queries all the customers of a specific administration the user has access to.
<br/>
For performance reasons, this list is paginated.
A maximum of **100** customers will be returned per request
If there are more customers to retrieve, you can use the `offset` argument to get the next page.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a list of [BusinessPartner](https://assets-prod.cdn.clearfacts.be/doc/businesspartner.doc.html) objects.
