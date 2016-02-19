public with sharing class Connection {

  public String apiKey;
  public String endpoint;

  public Connection(String apiKey) {
    this.apiKey = apiKey;
  }

  public Connection(String apiKey, String endpoint) {
    this.apiKey = apiKey;
    this.endpoint = endpoint;
  }

  public static HttpResponse sendSplashMessage(Splash splash) {

    validateSplash(splash);

    String endpoint;
    if (this.endpoint != null){
      endpoint = this.endpoint;
    } else {
      endpoint = 'https://app.leveleleven.com/api/public/v1/custom_splashes';
    }
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    req.setEndpoint(endpoint);
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
