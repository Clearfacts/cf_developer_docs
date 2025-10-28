## Personal Access Token

A personal access token is created once, manually, by a Clearfacts user.
This means that the user needs to log in to the Clearfacts web platform and create the token through the user interface.

This is typically used for offline or desktop applications.
For (online) applications used by multiple users, we recommend using [OpenID Connect](#openid-connect) instead.

As a developer, either:

* request a Clearfacts account from an accountant to create your token
* or ask them to create the token for you

Personal access tokens are similar to OAuth2 bearer tokens, but they do not expire.

This means it's an easy way to get a token for talking to the API using command line tools, e.g. while exploring the API's capabilities.

Personal access tokens are always exactly 80 ASCII characters (or bytes) long.

### Creating an Personal Access Token

To create a personal access token, you need to follow these steps:

1. Log in to the Clearfacts web platform.
   <br/>
   ![](images/docs/1_login.png)
2. In the top right corner, click on your profile and select "Integrations".
   <br/>
   ![](images/docs/2_menu.png)
3. Click on the button "Create new token".
   <br/>
   ![](images/docs/3_token_table.png)
4. Give your token a descriptive name.
5. Select the scopes you'd like to grant your token.
6. Click the "Save" button
   <br/>
   ![](images/docs/4_token_form.png)
7. The newly created token is displayed in a message box.  Make sure to copy it, as it is only displayed once.

<aside class="warning">
Tokens are like passwords, make sure to treat them in the same way and keep them safe.
If you lose your token, or believe it might have been compromised, revoke it in the Clearfacts interface, and create a new one.
</aside>

### Testing your token

```shell
# Replace `<token>` with your actual personal access token.
curl -H "Authorization: Bearer <token>" \
  -X GET \
  https://login.clearfacts.be/oauth2-server/userinfo
```

```json
{
  "sub":"user@domain.com",
  "username":"user@domain.com",
  "email":"user@domain.com"
}
```

You can use a simple curl request to test your token, and information about the user for whom the token was created.
