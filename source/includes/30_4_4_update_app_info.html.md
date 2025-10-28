## Mutation - Update App Info

```shell
curl -H "Authorization: Bearer <token>" \
  -X POST \
  https://api.clearfacts.be/graphql
  -F 'query=<query>' \
  -F 'variables={ "vatnumber": "0123123123", "imageUrl": "XXX", "emailAddress": "test@clearfacts.be", "badgeText": "NEW", "badgeTextColor": "#d5a855", "badgeColor": "red", "iconType": "trophy", "iconColor":"yellow" }'
```

```graphql
mutation update ($vatnumber: String!, $imageUrl: String, $emailAddress: String, $badgeText: String, $badgeTextColor: String, $badgeColor: String, $iconType: String, $iconColor: String) {
  updateAppInfo (vatnumber: $vatnumber, imageUrl: $imageUrl, emailaddress: $emailAddress, badge: { text: $badgeText, textColor: $badgeTextColor, color: $badgeColor }, icon: { type: $iconType, color: $iconColor }) {
    vatnumber,
    imageUrl,
    emailaddress,
    icon { type, color },
    badge { text, textColor, color }
  }
}
```

```json
{
  "data": {
    "updateAppInfo": {
      "vatnumber": "0123123123",
      "imageUrl" : "XXX",
      "emailaddress": "test@clearfacts.be",
      "icon": {
        "type": "trophy",
        "color": "yellow"
      },
      "badge": {
        "text": "NEW",
        "textColor": "#d5a855",
        "color": "red"
      }
    }
  }
}
```

You can create or update customization for the app connected to your integration.
<br/>
If you want an app connected to your integration, please contact *support at clearfacts dot be*.

The list of potential arguments can be found on the [Mutation](https://assets-prod.cdn.clearfacts.be/doc/mutation.doc.html) page.
<br/>
The result will be a singular [AppInfo](https://assets-prod.cdn.clearfacts.be/doc/appinfo.doc.html) object.
