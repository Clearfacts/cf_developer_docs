## Mutation - Upload Archive File

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
  -F 'query=<query>' \
  -F 'variables={ "vatNumber": "0123123123", "fileName": "test_upload.pdf", "type": "VARIOUS", "category": "f5c3d05a-2d05-4329-ae31-3f144bfbeb41" }' \
  -F file=@/home/user/Documents/example.pdf
```

```graphql
mutation upload ($vatNumber: String!, $fileName: String!, $type: VariousType!, $category: String!) {
 uploadArchiveFile (vatnumber: $vatNumber, filename: $fileName, type: $type, category: $category) {
   uuid,
   amountOfPages
 }
}
```

```json
{
  "data": {
    "uploadArchiveFile": {
      "uuid": "B74D7E7D-2408-4517-AA31-BB76018E844D",
      "amountOfPages": 1
    }
  }
}
```

This mutation uploads a file to the Various or Permanent Archive of a specific administration the user has access to.

The list of potential arguments can be found on the [Mutation](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) page.
<br/>
The result will be a singular [File](https://assets-prod.cdn.clearfacts.be/doc/file.doc.html) object.

This mutation is very similar to the [Mutation - Upload File](#mutation-upload-file).
<br/>
The category argument is an ID of a category retrieved using the [Query - Archive Categories](#query-archive-categories).
