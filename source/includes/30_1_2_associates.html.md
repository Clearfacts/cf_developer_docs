## Query - Associates

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query associates {
  associates {
    id,
    email
  }
}
```

```json
{
  "data": {
    "associates": [
      {
        "id": "123e4567-e89b-12d3-a456-426614174000",
        "email": "account.manager@acme.be"
      }
    ]
  }
}
```

This queries the associates of the accountant the user is linked to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a list of [Associate](https://assets-prod.cdn.clearfacts.be/doc/associatetype.doc.html) objects.
