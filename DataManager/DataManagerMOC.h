//
//  DataManagerMOC.h
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/**
 DataManagerMOC is a Singleton which will return always the same persistent store coordinator.
 
 To use this instance you can write:
 DataManagerMOC *context = [DataManagerMOC mainThreadContext];
 
 Note: according to the Apple developer guide a single object should not be used.
 
 https://developer.apple.com/library/mac/#documentation/DataManagement/Conceptual/CoreDataSnippets/Articles/stack.html
 
 But: The normal Apple way is to create the managedObjectContext inside the AppDelegate and pass it to all ViewControllers,
 while there is no possibility to do unit testing or use the database in other objects beside ViewControllers.
 
 http://stackoverflow.com/questions/5057873/what-are-nsmanagedobjectcontext-best-practices
 http://stackoverflow.com/questions/8627745/best-practices-for-passing-nsmanagedobjectcontext-around-to-uitabbarcontroller-c
 
 @author Andreas Peichert
 */
@interface DataManagerMOC : NSManagedObjectContext

/**
 Retrieve singelton persistent store coordinator.
 @returns an object of type NSManagedObjectContext
 */
+ (DataManagerMOC *)mainThreadContext;


@end
