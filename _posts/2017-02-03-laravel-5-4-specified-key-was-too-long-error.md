---
layout: post
title: "Laravel 5.4: Specified key was too long error"
date: 2017-02-03 14:00:00
author: Jorijn Schrijvershof
---

Since version 5.4 Laravel now uses MySQL character set `utf8mb4` by default. This brings support for emojis! ✅

If you use MySQL version 5.7.7 or higher you won't notice a thing, however if you use any older version or even MariaDB, you'll end up with this error:

```
[Illuminate\Database\QueryException]
SQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes (SQL: alter table users add unique users_email_unique(email))

[PDOException]
SQLSTATE[42000]: Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes
```

This makes sense. The multibyte version of a character takes more space than its counterpart: regular utf8.

They wrote about this in the [upgrade guide](https://laravel.com/docs/master/migrations#creating-indexes): Open up your `AppServiceProvider.php` file and edit the `boot` method to add a default key length:

```php
use Illuminate\Support\Facades\Schema;

public function boot()
{
    Schema::defaultStringLength(191);
}
```

This should fix your error. You can remove this statement when you've upgraded your MySQL server.
