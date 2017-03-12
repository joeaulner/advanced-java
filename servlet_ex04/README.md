# Test Steps
* Disable Cookie acceptance in Firefox
* Remove call to `response.encodeURL`,
    which would add the session ID as a URL parameter if called
* Start server, enter credentials and follow the links

# Test Results
* POST request made by submitting the form returns an HTML page indicating that login was successful.
    This is to be expected, as the Login servlet creates the session
* The following GET request made by clicking the link to "GetSession" indicates that the user is not
    logged in, which is to be expected. The call to request.getSession in the GetSession servlet
    returns null because the server was unable to locate a session due to the lack of a cookie storing
    the session ID on the client or the presence of the jsessionid parameter in the URL.