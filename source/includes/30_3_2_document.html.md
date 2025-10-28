## Query - Document

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
```

```graphql
query doc {
  document (id: "B74D7E7D-2408-4517-AA31-BB76018E844D") {
    date,
    ... on InvoiceDocument {
      type,
      paymentState
    }
  }
}
```

```json

{
 "data": {
    "document": {
      "date": "2025-01-01",
      "type": "PURCHASE",
      "paymentState": "UNPAID"
    }
  }
}
```

This queries a specific document the user has access to.
<br/>
It's only possible to query documents for which the ID is known.
<br/>
The only way to get a document's ID is after the initial [upload](#mutation-upload-file).

The list of potential arguments can be found on the [Query](https://assets-prod.cdn.clearfacts.be/doc/query.doc.html) page.
<br/>
The result will be a singular [InvoiceDocument](https://assets-prod.cdn.clearfacts.be/doc/invoicedocument.doc.html) object,
which extends from [Document](https://assets-prod.cdn.clearfacts.be/doc/document.doc.html).

In our example we illustrate how to query these fields.
The date field is part of the Document, so you can query the field like you normally would.
The type and paymentState however are fields of the InvoiceDocument.
To query these fields we need to use inline fragments `... on InvoiceDocument`.
