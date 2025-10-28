## Query - Archive Categories

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query categories {
  archiveCategories (vatnumber: "0123123123") {
    various {
      id,
      name
    },
    permanent {
      id,
      name
    }
  }
}
```

```json
{
  "data": {
    "archiveCategories": {
      "various": [
        {
          "id": "f5c3d05a-2d05-4329-ae31-3f144bfbeb41",
          "name": "Beleggingen"
        }
      ],
      "permanent": [
        {
          "id": "2fcff67d-3753-11e8-8c32-02907d97d1d8",
          "name": "Huurovereenkomst"
        }
      ]
    }
  }
}
```

This queries all the archive categories for a specific administration the user has access to.

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a singular [Categories](https://assets-prod.cdn.clearfacts.be/doc/categories.doc.html) object,
which contains the `various` and `permanent` properties.
Those contain an array of [Category](https://assets-prod.cdn.clearfacts.be/doc/category.doc.html) objects.
