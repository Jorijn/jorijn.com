---
layout: post
title: "Browser Testing met Laravel Dusk: Deel 2 - PhantomJS"
date: 2017-03-15 16:41:00
author: Jorijn Schrijvershof
---

In the previous part [I wrote](/browser-testing-with-laravel-dusk-in-5-4/) how you can implement Browser Testing with Laravel Dusk (5.4+). By default Laravel uses the Chrome Driver but the disadvantage is that when you execute these tests, Chrome has to be installed and actively pops up.

While this may be fine in local development, this could get annoying or be a problem when running these tests in a Dockerized instance or on acceptance/production environments. You'll want this to be *headless*. This means testing in the background without opening any windows.

## PhantomJS
PhantomJS is a headless WebKit scriptable with a JavaScript API. It has fast and native support for various web standards: DOM handling, CSS selector, JSON, Canvas, and SVG. Laravel is able to communicate over the Webdriver protocol with PhantomJS.

Installation of PhantomJS: [phantomjs.org/download.html](http://phantomjs.org/download.html)

### Installation instructions for Mac OS X
_For other platforms, see the link above._

Mac OS X: Download the release to a new folder and extract its contents.

```bash
$ wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip
$ unzip phantomjs-2.1.1-macosx.zip
$ cd phantomjs-2.1.1-macosx
```

### Execute

Start PhantomJS in webdriver-mode with this command:

```bash
$ ./bin/phantomjs --webdriver=4444
```

Open up the file: `tests/DuskTestCase.php` and change the driver to:

```php?start_inline=true
/**
 * Create the RemoteWebDriver instance.
 *
 * @return \Facebook\WebDriver\Remote\RemoteWebDriver
 */
protected function driver()
{
    return RemoteWebDriver::create(
        'http://localhost:4444', DesiredCapabilities::phantomjs()
    );
}
```

Open a new terminal tab and run the test again to see if it works:

```bash
$ php artisan dusk
```

If everything works, you'll see passed tests without any windows popping up on you.
 
![IMG_0065](/content/images/2017/07/IMG_0065.png)

