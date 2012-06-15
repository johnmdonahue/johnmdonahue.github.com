---
layout: post
title: GitHub API v3 everyauth Shim
subtitle: 
excerpt: Quick fix for GitHub oAuth API update
---

GitHub shut down [API v1 and v2](https://github.com/blog/1160-github-api-v2-end-of-life) today which will cause apps relying on [bnoguchi/everyauth](https://github.com/bnoguchi/everyauth) to fail. In lieu of a pull request or package update, here's a quick shim that overwrites the default [`apiHost`](https://github.com/bnoguchi/everyauth/blob/master/lib/modules/github.js#L10) and [`fetchOAuthUser`](https://github.com/bnoguchi/everyauth/blob/master/lib/modules/github.js#L22):

<script src="https://gist.github.com/2919806.js"></script>
<noscript>
  <a href="https://gist.github.com/2919806">View the gist &raquo;</a>
</noscript>