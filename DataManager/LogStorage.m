//
//  LogStorage.m
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import "LogStorage.h"
#import "DataManagerMOC.h"

@implementation LogStorage

NSString *const ENTITY_LOG = @"Log";

- (Log *)createData{
    // get single moc
    DataManagerMOC *context = [DataManagerMOC mainThreadContext];
    
    // new user entity
    NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_LOG
                                                            inManagedObjectContext:context];
    
    return (Log *)entity;
}

- (Log *)retrieveData {
    DataManagerMOC *context = [DataManagerMOC mainThreadContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:ENTITY_LOG
                                              inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request
                                          error:&error];
    
    //NSLog(@"arr=%@",arr); // debug
    
    Log *log = nil;
    
    // return user or nil
    if([arr count] > 0) {
        log = [arr objectAtIndex:0];
    }
    
    return log;
}


- (BOOL)deleteData{
    DataManagerMOC *context = [DataManagerMOC mainThreadContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:ENTITY_LOG
                                              inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request
                                          error:&error];
    
    for (NSManagedObject *user in arr) {
        [context deleteObject:user];
        //NSLog(@"delete ..."); // debug
    }
    
    return [self saveData];
}


- (BOOL)saveData{
    DataManagerMOC *context = [DataManagerMOC mainThreadContext];
    
    NSError *error;
    if (![context save:&error]) {
        return NO;
    }
    return YES;
}


- (int)countData{
    DataManagerMOC *context = [DataManagerMOC mainThreadContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:ENTITY_LOG
                                              inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSUInteger count = [context countForFetchRequest:request
                                               error:&error];
    
    return count;
}

@end
