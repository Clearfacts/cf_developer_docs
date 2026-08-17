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

We will contact all existing integrators as this migration progresses. In a timeframe that has not yet been determined, we will stop supporting long-lived access tokens issued through OpenID Connect. Manually created [personal access tokens](#personal-access-token), which do not expire, are not affected.
