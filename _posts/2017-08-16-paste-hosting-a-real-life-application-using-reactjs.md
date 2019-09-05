---
layout: post
title: "paste.hosting: A real life application using ReactJS"
date: 2017-08-16 16:41:00
author: Jorijn Schrijvershof
---

During my journey on learning React, I wanted to create a real life application to try some popular technologies. The idea was born, my goal would to be to create worlds most overkill application to host simple code snippets. Although the application itself does not contain many features, it’s built using:

* Progressive Web App (Service workers). You could use it offline. But generally, it's just very fast.
* It's created using create-react-app.
* It uses redux for global state tracking and redux-saga for asynchronous updating and API communication.
* I try to follow Webpack conventions and import my CSS and images.

You can find the source code here: [https://github.com/jorijn/pastebin-frontend](https://github.com/jorijn/pastebin-frontend)

The application is hosted at: [https://paste.hosting](https://paste.hosting)

![Screenshot of paste.hosting](/content/images/2017/08/Screen-Shot-2017-08-16-at-10.14.49.png)

## The API
I created a companion API for this project in Laravel. It runs on Laravel 5.4 and PHP 7.1. You can find the source code here: [https://github.com/jorijn/pastebin-backend](https://github.com/jorijn/pastebin-backend)
