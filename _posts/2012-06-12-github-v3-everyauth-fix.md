---
layout: post
title: GitHub API v3 everyauth Shim
subtitle: 
excerpt: Quick fix for GitHub oAuth API update
---

GitHub shut down [API v1 and
v2](https://github.com/blog/1160-github-api-v2-end-of-life) today which
will cause apps relying on
[bnoguchi/everyauth](https://github.com/bnoguchi/everyauth) to fail. In
lieu of a pull request or package update, here's a quick shim that
overwrites the default
[`apiHost`](https://github.com/bnoguchi/everyauth/blob/master/lib/modules/github.js#L10)
and
[`fetchOAuthUser`](https://github.com/bnoguchi/everyauth/blob/master/lib/modules/github.js#L22).

<!-- more -->

```javascript
var everyauth = require('everyauth')

everyauth.github

  .apiHost('https://api.github.com')

  .fetchOAuthUser(function (accessToken) {
    var p = this.Promise()
    this.oauth.get(this.apiHost() + '/user', accessToken, function (err, data) {
      if (err) {
        return p.fail(err)
      }
      var oauthUser = JSON.parse(data)
      p.fulfill(oauthUser)
    })
    return p
  })
```

