public with sharing class Splash {
  
  private String slug;
  private String subject;
  private String email;
  private String message;
  private String imgUrl;

  public Splash(){ }

  public Splash(String slug, String subject, String message) {
    this.slug = slug;
    this.subject = subject;
    this.message = message;
  }

  public void setSlug(String slug) {
    this.slug = slug;
  }

  public String getSlug() {
    return this.slug;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getSubject() {
    return this.subject;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getEmail() {
    return this.email;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getMessage() {
    return this.message;
  }

  public void setImgUrl(String imgUrl) {
    this.imgUrl = imgUrl;
  }

  public String getImgUrl() {
    return this.imgUrl;
  }



}
