## Refresh Tokens

We are gradually migrating OpenID Connect integrations from long-lived access tokens to short-lived access tokens combined with refresh tokens.

To opt in, include the `offline_access` scope in the authorization request. When the authorization code is exchanged at the token endpoint, the response contains an access token that is valid for one hour and a refresh token that is valid for 30 days.

When the access token expires, request a new token pair by sending the refresh token to the token endpoint:

```shell
curl -X POST \
  https://api.clearfacts.be/oauth2-server/token \
  -d "client_id=<client-id>" \
  -d "client_secret=<client-secret>" \
  -d "grant_type=refresh_token" \
  -d "refresh_token=<refresh-token>"
```

The response contains a new one-hour access token and a new refresh token. Replace the previous refresh token with the new one and store it securely. Repeat this flow whenever the current access token expires. If the refresh token expires or is revoked, the user must complete the authorization flow again.

In a timeframe that has not yet been determined, we will stop supporting long-lived access tokens issued through OpenID Connect. Manually created [personal access tokens](#personal-access-token), which do not expire, are not affected.

### Migrating Existing Tokens

Applications that already have an access token can migrate it without asking the user to authorize again. Send the existing token in the `Authorization` header to the migration endpoint:

```shell
curl -X POST \
  https://api.clearfacts.be/oauth2-server/token/migrate \
  -H "Authorization: Bearer <existing-access-token>"
```

No request body or client credentials are required for migration. Any valid, unexpired access token can be migrated, including legacy OpenID Connect tokens. The original token does not need the `offline_access` scope.

On success, the endpoint returns HTTP 200 with a token response:

```json
{
  "token_type": "Bearer",
  "expires_in": 3600,
  "access_token": "<new-access-token>",
  "refresh_token": "<new-refresh-token>",
  ...
}
```

The response is a new access token, with matching refresh token. The new token will have the exact same client, user, and scopes.

Migrating immediately revokes the original access token and any refresh tokens attached to it.
The old token cannot be used to retry migration after success.
If the successful response is lost, a new user authorization is needed to regain access.
