//
//  LogStorage.h
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import <Foundation/Foundation.h>
#import "Log.h"

/**
 This class is used to work with CoreData with CRUD.
 
 @author Andreas Peichert
 */
@interface LogStorage : NSObject

/**
 The name for log entities.
 */
FOUNDATION_EXPORT NSString *const ENTITY_LOG;

/**
 Create new empty Log.
 @returns an object of type Log
 */
- (Log *)createData;

/**
 Retrieve first extisting Log.
 @returns an object of type Log or nil
 */
- (Log *)retrieveData;

/**
 Deletes all Log data in CoreData.
 @returns YES when it succeeded, NO if it failed
 */
- (BOOL)deleteData;

/**
 Saves actual Log data in CoreData.
 @returns YES when it succeeded, NO if it failed
 */
- (BOOL)saveData;

/**
 Return actual count of Objects.
 @returns actual count of Objects
 */
- (int)countData;

@end
