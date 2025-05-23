## Creating or updating the customization of an app

```graphql
mutation UpdateAppInfo ($vatnumber: String!, $imageUrl : String, $emailAddress: String,$badgeText: String, $badgeTextColor: String, $badgeColor: String, $iconType: String, $iconColor: String) {
    updateAppInfo (vatnumber: $vatnumber, imageUrl: $imageUrl, emailaddress: $emailAddress, badge: {text: $badgeText, textColor: $badgeTextColor, color: $badgeColor}, icon: {type: $iconType, color: $iconColor}) {
        vatnumber,
        imageUrl,
        emailaddress,
        icon { type, color },
        badge{ text, textColor, color }
    }
}


```
```json
{ 
    "vatnumber": "0123123123",
    "imageUrl": "XXX", 
    "emailAddress": "test@clearfacts.be", 
    "badgeText": "NEW", 
    "badgeTextColor": "#d5a855", 
    "badgeColor": "red", 
    "iconType": "trophy", 
    "iconColor":"yellow"}
```

> will result in

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

You can create or update customization for the app connected to your client id. If you want an app connected to your client id, please contact support@clearfacts.be.

If you'd like to test the example above, you can use this link to the GraphQL Playground:
[https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-deb675cd-896b-4b9a-9d2d-61f23b9bf03f](https://www.postman.com/clearfacts/workspace/clearfacts-public-api/request/27143459-deb675cd-896b-4b9a-9d2d-61f23b9bf03f)

<aside class="notice">
Make sure to replace the placeholder <code>INSERT_YOUR_TOKEN_HERE</code> with your own access token in the Authorization tab on the collection level and hit the save button.
</aside>
