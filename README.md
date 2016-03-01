# channel11-api-salesforce
A Channel11 client library for Salesforce.com (Apex)

## Getting Started

To get started sending custom splashes to your Channel11 channels,
make sure you have completed the following.

1. Log into Channel11 and obtain your API Key from your personal settings
2. Create at least one Custom Splash Type in organization settings
3. Create or edit a Channel and enable your custom splash type
4. Install the classes contained in this repo to your Salesforce org

## Using the Code

Creating a custom splash from Apex is rather simple. You just need to create a 
`Connection` object, create a `Splash`, and use your connection object
to send the splash to Channel11. Any channels listening for your splash
will render the splash in near-real-time.

Here's a simple example.

```java
private String ch11APIKey = '<yourapikey>';

Connection conn = new Connection(ch11APIKey);

Splash bigDealSplash = new Splash();

bigDealSplash.setSlug('big_deal');
bigDealSplash.setSubject('Big Deal!');
bigDealSplash.setMessage('Johnny D just closed $50k at ABC Corp!');
bigDealSplash.setImgUrl('http://i.giphy.com/KJg6Znn4V1Jcs.gif');

conn.sendSplash(bigDealSplash);
```

## API

### `new Connection(<String apiKey>, [String endpoint])`

Construct a new Channel11 connection object.

Arguments:

* `apiKey`: [String|required] Your Channel11 apiKey.
* `endpoint`: [String|optional] The splash endpoint to send
splashes to. This should not be specified unless instructed to
by LevelEleven support. This defaults to the proper endpoint
at https://app.leveleleven.com


### `connection.sendSplash(<Splash splash>)`

Sends a Splash object to Channel11 via https

Arguments:

* `splash`: [Splash:required] The Splash object containing the 
data for your splash

### `new Splash([String slug, String, subject, String message])`

Construct a new Splash object

Arguments:

* `slug`: [String:optional] The custom splash slug.
* `subject`: [String:optional] The custom splash subject. Should
be 45 characters or less.
* `message`: [String:optional] The custom splash message. Should
be 45 characters or less.

### `splash.setSlug(<String slug>)`

Set the slug for the splash

Arguments: 

* `slug`: [String:required] The custom splash slug

### `splash.setSubject(<String subject>)`

Set the subject for the splash

Arguments: 

* `subject`: [String:required] The custom splash subject

### `splash.setMessage(<String message>)`

Set the message for the splash

Arguments: 

* `message`: [String:required] The custom splash message. Should
be 45 characters or less.

### `splash.setEmail(<String email>)`

Set the user's email for the splash. Email addresses can be
used to look up the a user's image for use in the splash. If
`imgUrl` is specified, the email address will be ignored and
the specified image will be shown.

Arguments: 

* `email`: [String:required] The user's email for the splash.

## Tips

* If you're going to send custom splashes from Apex Triggers, remember
that you must do this from an Async/Future method.
* Store your API key somewhere you can update it easily such as custom
settings. This way, if you reset your api key it's easy to change.
