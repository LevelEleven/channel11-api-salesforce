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

## Tips

* If you're going to send custom splashes from Apex Triggers, remember
that you must do this from an Async/Future method.
* Store your API key somewhere you can update it easily such as custom
settings. This way, if you reset your api key it's easy to change.
