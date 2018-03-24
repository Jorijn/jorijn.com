---
layout: post
current: post
cover: assets/images/covers/browser-testing-with-laravel-dusk-in-5-4.jpg
navigation: True
title: Browser Testing with Laravel Dusk in 5.4
date: 2017-02-03 16:41:00
tags: laravel
class: post-template
subclass: 'post tag-laravel'
author: jorijn
---

[Dusk](https://laravel.com/docs/5.4/dusk) is a new component in the newly released Laravel 5.4. It simplifies the way us developers can create acceptance tests, better known as browser testing.
​
## Why you should have an interest in having browser tests
An ever growing amount of logic is being handed out to the browser these days. Back in the day we could write a full test suite for our PHP application and assume everything would work fine. We didn't have client-side validation or ajax calls. A few years back JavaScript was there to assist us in improving functionality but now it's defining it.

If assumed a full covering product solution, unit tests don't cut it anymore.

Unit and feature tests will answer these kinds of questions for you:

* Does my API return a valid JSON response?
* Does my function format the data properly given the same input?
* If I log in with a normal user, will he/she be able to visit admin pages?

However, if you test using a browser you can simulate an actual visitor on your project. This way, you'll be able to ask questions like:
​
* Given client-side validation, do the borders turn red?
* Is my button being disabled when the form is submitted?
* Will the purchase flow of a product generate JavaScript errors?

Using browser tests, you'll know when something breaks if you upgrade jQuery for example.
​
## How you can implement this
As just about everything with Laravel, the syntax is clear and logic easy to comprehend. I'll discuss the steps below to create your first browser test.
​
### Installation
_This will be a brief description of the manual found at the [offical documentation page](https://laravel.com/docs/5.4/dusk) of Laravel Dusk. I'll assume you have a working Laravel installation set up._
​
To start, add `laravel/dusk` to your projects dependencies. 
​
```bash
$ composer require laravel/dusk
```
​
When composer is done, add the ServiceProvider to your application's configuration file. You'll only want to do this locally and on a testing environment, there is no point on loading all the files when your application is running in production.
​
Open up the `register` method in the file `AppServiceProvider.php`
​
```php
use Laravel\Dusk\DuskServiceProvider;
​
/**
 * Register any application services.
 *
 * @return void
 */
public function register()
{
    if ($this->app->environment('local', 'testing')) {
        $this->app->register(DuskServiceProvider::class);
    }
}
```
​
Then, create all the required folders on disk using this command:
​
```bash
$ php artisan dusk:install
```
​
Make sure that your `APP_URL` is set correctly in your `.env` file. Mine is `https://browsertest-test.app/`.
​
### Creating our first TestCase: User Login
You can use the command line generator to create a new Dusk test:
​
```bash
$ php artisan dusk:make LoginTest
```
​
It's located in `tests/Browser`. The things I want to accomplish in this test are:
​
* Create a user with email address `test@jorijn.com`
* Test if I'm able to login using this newly made user
* Delete the newly made user
​
Add this method to our new test file:
​
```php?start_inline=true
public function testLogin()
{
    $user = factory(\App\User::class)->create([
        'email' => 'test@jorijn.com',
    ]);
    ​
    $this->browse(function ($browser) use ($user) {
        $browser->visit('/login')
            ->type('email', $user->email)
            ->type('password', 'secret')
            ->press('Login')
            ->assertPathIs('/home');
    });
    ​
    $user->delete();
}
```
​
Now, run Dusk from the command line: 
​
```bash
$ php artisan dusk
```
​
​
If everything is working you'll now see a Chrome window open up that executes all your method commands automatically. 
​
![IMG_0060](/content/images/2017/07/IMG_0060.PNG)
​
​
### Update
I [wrote about](/browser-testing-met-laravel-dusk-deel-2-phantomjs) doing these tests "headless" using PhantomJS.