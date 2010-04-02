<%@ include file="common_header.jsp" %>

<%
  Token requestToken = null;

  try {
    requestToken = OpenSocialOAuthClient.getRequestToken(client, provider);
    session.setAttribute("token_secret", requestToken.secret);
  } catch (Exception e) {
    out.println("<b>ERROR:</b> Failed to fetch request token: " + e.getClass());
    out.println("<pre>");
    e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</pre>");
    return;
  }

  String url = OpenSocialOAuthClient.getAuthorizationUrl(provider,
      requestToken, "http://localhost:8080/threelegged/access_token.jsp");
%>

<html>
  <head>
    <title>Three-legged test</title>
  </head>
  <body>
    <a href="<%= url %>">Sign in</a> to MySpace using this application!
  </body>
</html>