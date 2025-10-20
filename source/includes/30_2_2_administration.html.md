## Query - Administration

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query admin {
  administration (companyNumber: "0123123123") {
    name,
    companyNumber,
    accountManager,
    emails {
      type,
      emailAddress
    }
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
    "administration": {
      "name": "Acme Company",
      "companyNumber": "0123123123",
      "accountManager": "account.manager@acme.be",
      "emails": [
        {
          "type": "purchase",
          "emailAddress": "aankoop-0123123123@acme.clearfacts.be"
        },
        {
          "type": "purchase",
          "emailAddress": "achat-0123123123@acme.clearfacts.be"
        }
      ],
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

This queries a specific administration the user has access to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a singular [Administration](https://assets-prod.cdn.clearfacts.be/doc/administration.doc.html) object.
