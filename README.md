DataManager
===========

Using Core Data with CRUD for iOS

Introduction
------------

Apple suggest to use Core Data directly in the view, but this makes it hard to work if you want to separate the application into a MVC structure or do a test driven approach and write Unit Tests. With DataManager you can add a database layer into you application, with full CRUD support.

files
-----
- Log.{h,m} entity which consists of a text and time
- LogStorage.{h,m} create, read, update and delete
- DataManager.{h,m} will setup CoreData classes
- DataManagerMOC.{h,m} is a singleton of type managedObjectModel to prevent conflicts
- DataManager.xcdatamodeld is the local database


testrun
-------

see [AppDelegate.m](https://github.com/andpei/DataManager/blob/master/DataManager/AppDelegate.m#L28) for a simple test scenario which will work with an Log entity at the database and outputs:

```
DataManager[4801:11603] count: 0
DataManager[4801:11603] adding ...
DataManager[4801:11603] count: 1
DataManager[4801:11603] reading ...
DataManager[4801:11603] log: 2013-02-08 13:26:05 +0000 just testing
DataManager[4801:11603] update ...
DataManager[4801:11603] log: 2013-02-08 13:26:05 +0000 just updating
DataManager[4801:11603] deleting ...
DataManager[4801:11603] count: 0
```

