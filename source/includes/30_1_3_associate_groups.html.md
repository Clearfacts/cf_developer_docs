## Query - Associate Groups

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query groups {
  associateGroups {
    id,
    name
  }
}
```

```json
{
  "data": {
    "associateGroups": [
      {
        "id": "2ff2f0a8-3753-11e8-8c32-02907d97d1d8",
        "name": "Test Group"
      }
    ]
  }
}
```

This queries the associate groups of the accountant the user is linked to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a list of [AssociateGroup](https://assets-prod.cdn.clearfacts.be/doc/associategroup.doc.html) objects.
