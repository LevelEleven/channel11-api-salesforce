public with sharing class Splash {
  public String slug;
  public String subject;
  public String email;
  public String message;
  public String imgUrl;

  public Splash(){

  }

  public Splash(String slug, String subject, String message) {
    this.slug = slug;
    this.subject = subject;
    this.message = message;
  }

  public void setSlug(String slug) {
    this.slug = slug;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public void setImgUrl(String imgUrl) {
    this.imgUrl = imgUrl;
  }

}