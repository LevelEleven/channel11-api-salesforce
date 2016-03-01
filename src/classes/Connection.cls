public with sharing class Connection {
  
  private static final DEFAULT_ENDPOINT = 'https://app.leveleleven.com/api/public/v1/custom_splashes';

  public String apiKey;
  public String endpoint;

  public Connection(String apiKey) {
    if(this.apiKey == null) {
      throw new ConnectionException('apiKey must not be null');
    }
    this.apiKey = apiKey;
    this.endpoint = Connection.DEFAULT_ENDPOINT;
  }

  public Connection(String apiKey, String endpoint) {
    if(this.apiKey == null) {
      throw new ConnectionException('apiKey must not be null');
    }
    if(this.endpoint == null) {
      throw new ConnectionException('endpoint must not be null');
    }
    this.apiKey = apiKey;
    this.endpoint = endpoint;
  }

  public static HttpResponse sendSplashMessage(Splash splash) {

    validateSplash(splash);

    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setEndpoint(this.endpoint);
    req.setMethod('POST');
    req.setHeader('Accept', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + this.apiKey);
    req.setHeader('Content-Type', 'application/json');
    req.setBody(JSON.serializePretty(splash));

    system.debug(JSON.serializePretty(splash));

    if (!Test.isRunningTest()) return h.send(req);

    return null;
  }

  private static void validateSplash(Splash splash) {
    if(splash.slug == null) {
      throw new ConnectionException('Splash slug is required');
    }
    if(splash.subject == null) {
      throw new ConnectionException('Splash subject is required');
    }
    if(splash.message == null) {
      throw new ConnectionException('Splash message is required');
    }

  }

}
