## Mutation - Add Associate

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
  -F 'query=<query>' \
  -F 'variables={ "associate": { "firstName": "Test", "lastName": "Associate", "email": "associate@acme.be", "type": "ADMIN", "associateGroups": [{ "id": "2ff2f0a8-3753-11e8-8c32-02907d97d1d8" }], "active": true, "language": "nl_BE", "sendActivationMail": false } }'
```

```graphql
mutation add ($associate: AddAssociateArgument!) {
  addAssociate (associate: $associate) {
    id,
    associateGroups {
      id,
      name
    },
    plainPassword
  }
}
```

```json
{
  "data": {
    "addAssociate": {
      "id": "198772ef-d095-4859-9328-dc47950853b9",
      "associateGroups": [
        {
          "id": "2ff2f0a8-3753-11e8-8c32-02907d97d1d8",
          "name": "Test Group"
        }
      ],
      "plainPassword": "generatedPassword123"
    }
  }
}
```

This adds a new associate to the accountant the user is linked to.

The list of potential arguments can be found on the [Mutation](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) page.
<br/>
The result will be a singular [Associate](https://assets-prod.cdn.clearfacts.be/doc/associatetype.doc.html) object.

<aside class="notice">
This is the only opportunity to retrieve the plain password for the new associate.
</aside>
