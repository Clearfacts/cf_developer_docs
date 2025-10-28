## Mutation - Edit Associate

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
  -F 'query=<query>' \
  -F 'variables={ "id": "198772ef-d095-4859-9328-dc47950853b9", "associate": { "firstName": "Updated" } }'
```

```graphql
mutation edit ($id: ID!, $associate: EditAssociateArgument!) {
  editAssociate (id: $id, associate: $associate) {
    id,
    firstName
  }
}
```

```json
{
  "data": {
    "editAssociate": {
      "id": "198772ef-d095-4859-9328-dc47950853b9",
      "firstName": "Updated"
    }
  }
}
```

This edits an existing associate of the accountant the user is linked to.

The list of potential arguments can be found on the [Mutation](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) page.
<br/>
The result will be a singular [Associate](https://assets-prod.cdn.clearfacts.be/doc/associatetype.doc.html) object.
