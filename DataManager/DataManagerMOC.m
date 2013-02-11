//
//  DataManagerMOC.m
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import "DataManagerMOC.h"

@implementation DataManagerMOC

+ (DataManagerMOC *)mainThreadContext {
    
    static DataManagerMOC *moc;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moc = [[self alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        // Setup persistent store coordinator here
        
        // Returns the URL to the application's Documents directory.
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                                       inDomains:NSUserDomainMask] lastObject];
        
        // Returns the managed object model for the application.
        // If the model doesn't already exist, it is created from the application's model.
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataManager"
                                                  withExtension:@"momd"];
        NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        // Returns the persistent store coordinator for the application.
        // If the coordinator doesn't already exist, it is created and the application's store added to it.
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"DataManager.sqlite"];
        NSError *error = nil;
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                      configuration:nil
                                                                URL:storeURL
                                                            options:@{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
                                                              error:&error]) {
            
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             
             Typical reasons for an error here include:
             * The persistent store is not accessible;
             * The schema for the persistent store is incompatible with current managed object model.
             Check the error message to determine what the actual problem was.
             
             If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
             
             If you encounter schema incompatibility errors during development, you can reduce their frequency by:
             * Simply deleting the existing store:
             [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
             
             * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
             @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
             
             Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
             */
            
            // we have a error, so delete all data
            [[NSFileManager defaultManager] removeItemAtURL:storeURL
                                                      error:nil];
            
            // create all data new
            storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"DataManager.sqlite"];
            error = nil;
            persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
            
            // check it again
            if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil
                                                                    URL:storeURL
                                                                options:nil
                                                                  error:&error]) {
                
                // connection failed
                //NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
        
        // Returns the managed object context for the application.
        // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
        NSPersistentStoreCoordinator *coordinator = persistentStoreCoordinator;
        NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
        
        // return singleton
        moc = (DataManagerMOC *)managedObjectContext;
    });
    return moc;
}

@end
