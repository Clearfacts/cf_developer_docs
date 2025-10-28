## Query - Accountant

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query accountant {
  accountant {
    name,
    companyNumber,
    email,
    address {
      streetAddress,
      country {
        iso2,
        name
      }
    }
  }
}
```

```json
{
  "data": {
    "accountant": {
      "name": "Acme Company",
      "companyNumber": "0123123123",
      "email": "accountant@acme.be",
      "address": {
        "streetAddress": "Street 16",
        "country": {
          "iso2": "BE",
          "name": "Belgium"
        }
      }
    }
  }
}
```

This queries the accountant the user is linked to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a singular [Accountant](https://assets-prod.cdn.clearfacts.be/doc/accountant.doc.html) object.
