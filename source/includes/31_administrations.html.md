## Query the list of accessible administrations

```graphql
query admins {
  administrations {
    name, 
    companyNumber, 
    emails {
      type,
      emailAddress
    }
    companyType,
    address {
      streetAddress, 
      country {
        iso2,
        name
      }
    },
    accountManager
  }
}
```
> this will return a list of administrations:

```json
{
  "data": {
    "administrations": [
      {
        "name": "Acme Company",
        "companyNumber": "0123123123",
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
        "companyType": null,
        "address": {
          "streetAddress": "Street 16",
          "country": {
            "iso2": "BE",
            "name": "Belgium"
          }
        },
        "accountManager": "account.manager@acme.be"
      }
    ]
  }
}
```

This first example queries all the administrations a user has access to.

For each administration we'll fetch basic information such as name, company number and address, as well as the
account manager of that administration at the accountants office.  Finally we'll add the email addresses that can
be used to send documents to.

The result is a JSON structure with an array of all the administrations and their requested properties.
(Please note that the result has been trimmed for brevity.)

If you'd like to test the example above, you can use this link to the GraphQL Playground:
[https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-c579be61-8508-4e3d-b00b-ff6678e66e28](https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-c579be61-8508-4e3d-b00b-ff6678e66e28)

<aside class="notice">
Make sure to replace the placeholder <code>INSERT_YOUR_TOKEN_HERE</code> with your own access token in the Authorization tab on the collection level and hit the save button.
</aside>
