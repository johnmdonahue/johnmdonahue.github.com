o: ActiveSupport::Cache::Entry	:@compressedF:@expires_in0:@created_atf1340954260.5065799:@value"èI"Évar everyauth = require('everyauth')

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
  }):ET