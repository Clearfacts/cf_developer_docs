## Mutation - Upload File

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
  -F 'query=<query>' \
  -F 'variables={ "vatNumber": "0123123123", "fileName": "test_upload.pdf", "invoiceType": "PURCHASE" }' \
  -F file=@/home/user/Documents/example.pdf
```

```graphql
mutation upload ($vatNumber: String!, $fileName: String!, $invoiceType: InvoiceTypeArgument!) {
 uploadFile (vatnumber: $vatNumber, filename: $fileName, invoicetype: $invoiceType) {
   uuid,
   amountOfPages
 }
}
```

```json
{
  "data": {
    "uploadFile": {
      "uuid": "B74D7E7D-2408-4517-AA31-BB76018E844D",
      "amountOfPages": 1
    }
  }
}
```

This mutation uploads a file to the Inbox of a specific administration the user has access to.

The list of potential arguments can be found on the [Mutation](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) page.
<br/>
The result will be a singular [File](https://assets-prod.cdn.clearfacts.be/doc/file.doc.html) object.

The way in which we send this mutation differs a bit from regular queries.
Since we have to provide a file as data, we will send our information as form-data instead of a text-based content-type like application/json or application/graphql.

The file must be present as a parameter named `file`, while the mutation and arguments can be provided as regular text-based
content in the form, respectively called `query` and `variables`.

<aside class="notice">
Supported file types are PDFs (application/pdf), images (image/jpeg) and XML files (application/xml).
<br/>
XML files must meet the <a href="https://docs.peppol.eu/poacc/billing/3.0/" target="_blank">Billing3 standard</a> or the Belgian variant <a href="https://www.ubl.be" target="_blank">UBL.BE</a>.
<br/>
Additionally, we support the legacy E-FFF format.
</aside>
