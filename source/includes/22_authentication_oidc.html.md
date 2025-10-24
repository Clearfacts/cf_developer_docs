## OpenID Connect

If you're a developer and want to enable the users of your application to generate access tokens,
effectively granting your application access to Clearfacts on their behalf, then
implementing OpenID Connect (OIDC) is the way to go.

OpenID Connect 1.0 is a simple identity layer on top of the **OAuth 2.0** protocol.
It allows Clients to verify the identity of the user based on the authentication performed by
an Authorization Server, as well as to obtain basic profile information about the user in
an interoperable and REST-like manner.

Building a secure OpenID Connect client is difficult, so you should use an existing and
proven implementation in the language of your choice.
[Click here for a list of client libraries.](http://openid.net/developers/libraries/)

If you're interested in learning more, check out the following link:
[An intro on OpenID Connect.](http://openid.net/connect/)

### Application Registration

In order to use OpenID Connect, your application needs to be registered with Clearfacts.
This can now be done through the Clearfacts web platform.

As a developer, either:

* request a Clearfacts account from an accountant to create your application
* or ask them to create the application for you

To create an application, you need to follow these steps:

1. Log in to the Clearfacts web platform.
   ![](images/docs/1_login.png)
2. In the top right corner, click on your profile and select "Integrations".
   ![](images/docs/2_menu.png)
3. Click on the button "Create new application".
   ![](images/docs/3_application_table.png)
4. Give your application a name.
5. Fill in the Redirect URI that the user should land on after authorizing the application.
6. Click the "Save" button
   ![](images/docs/4_application_form.png)
7. The Client ID and Secret for the newly created application are displayed in a message box.
Make sure to copy them, as they are only displayed once.

<aside class="warning">
The Secret is like a password, make sure to treat it in the same way and keep it safe.
If you lose your secret, or believe it might have been compromised, revoke the application in the Clearfacts interface, and create a new one.
</aside>

### Auto Discovery

```shell
curl -X GET \
  https://login.clearfacts.be/.well-known/openid-configuration
```

```json
{
	"issuer": "https://login.clearfacts.be",
	"authorization_endpoint": "https://login.clearfacts.be/oauth2-server/authorize",
	"token_endpoint": "https://login.clearfacts.be/oauth2-server/token",
	"userinfo_endpoint": "https://login.clearfacts.be/oauth2-server/userinfo",
	"jwks_uri": "https://login.clearfacts.be/oauth2-server/jwks.json",
	"response_types_supported": ["code", "token"],
	"subject_types_supported": ["public"],
	"id_token_signing_alg_values_supported": ["RS256"],
	"scopes_supported": ["openid", "profile", "email"]
}
```

OIDC has a way to configure clients automatically through a Discovery Document URL.
The URL for this is defined by the OIDC spec and can be inspected manually
if you'd like to see which features are supported in our implementation.

[https://login.clearfacts.be/.well-known/openid-configuration](https://login.clearfacts.be/.well-known/openid-configuration)

<aside class="notice">
Note that the login.clearfacts.be domain is our generic OpenID Connect Endpoint for all our customers.
If you are implementing a flow for a single accountant, you can replace login.clearfacts.be with the accountant's specific domain.
<br/>
(eg acme.clearfacts.be, or their respective white-labeled domain)
<br/>
This will ensure that the user sees their familiar login screen with the accountant's logo and name, instead of the Clearfacts branding.
Only users from this accountant will be able to login.
<br/>
Example: https://acme.clearfacts.be/.well-known/openid-configuration
</aside>

### Authorization Code flow

OpenID connect (or OAuth2) supports several flows to obtain an access token.

Currently we only support the "Authorization Code Flow".
This is the most commonly used and most secure flow, but it cannot be used by client-side only apps like javascript apps without a back-end.
To learn more about how this works, click [here](https://openid.net/developers/how-connect-works/).

### Access Token

The token that you'll receive using OIDC is not a random byte string, but a signed JWT token that can be decoded
(see: [jwt.io](https://jwt.io/)).
<br/>
The JWT token contains the basic claims (sub, username, email) as well as an access token.
<br/>
This is an access token, 80 character long, like you would get when manually creating a [personal access token](#personal-access-token).

Both the JWT token and the access token can be used in the `Authorization` header.
<br/>
`Authorization: Bearer <token>`
This means you can store either one depending on your use case.

### Multiple Tokens

You can create multiple tokens for a user and application combination.

This is useful if your applications supports multiple workflows. For example:

* one for sign-in, only requiring basic user information
* another one for access to the user's archive

Using multiple tokens, your application can perform the authorization flow for each use case, requesting only the scopes needed.

The number of active tokens is limited to 10.
If your application requests more than that, the least recently used tokens (with the same scopes being requested) will be revoked.
