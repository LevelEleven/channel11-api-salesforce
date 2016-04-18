public with sharing class Connection {
  
  private static final String DEFAULT_ENDPOINT = 'https://app.leveleleven.com/api/public/v1/custom_splashes';

  public String apiKey;
  public String endpoint;

  public Connection(String apiKey) {
    if(apiKey == null) {
      throw new ConnectionException('apiKey must not be null');
    }
    this.apiKey = apiKey;
    this.endpoint = Connection.DEFAULT_ENDPOINT;
  }

  public Connection(String apiKey, String endpoint) {
    this.apiKey = apiKey;
    this.endpoint = endpoint;
    if(this.apiKey == null) {
      throw new ConnectionException('apiKey must not be null');
    }
    if(this.endpoint == null) {
      throw new ConnectionException('endpoint must not be null');
    }
  }

  public HttpResponse sendSplashMessage(Splash splash) {

    validateSplash(splash);

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setEndpoint(endpoint);
    req.setMethod('POST');
    req.setHeader('Accept', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + apiKey);
    req.setHeader('Content-Type', 'application/json');
    req.setBody(JSON.serializePretty(splash));
  
    return h.send(req);
  }

  private static void validateSplash(Splash splash) {
    if(splash.getSlug() == null) {
      throw new ConnectionException('Splash slug is required');
    }
    if(splash.getSubject() == null) {
      throw new ConnectionException('Splash subject is required');
    }
    if(splash.getMessage() == null) {
      throw new ConnectionException('Splash message is required');
    }

  }

}
