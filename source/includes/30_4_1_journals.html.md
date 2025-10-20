## Query - Journals

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query journals {
  journals (companyNumber: "0123123123") {
    id,
    name,
    creditNote
  }
}
```

```json
{
  "data": {
    "journals": [
      {
        "id": "CFAK",
        "name": "ClearFacts Aankopen",
        "creditNote": false
      }
    ]
  }
}
```

This queries all the journals of a specific administration the user has access to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a list of [Journal](https://assets-prod.cdn.clearfacts.be/doc/journal.doc.html) objects.
