//
//  Log.h
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Log : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * time;

@end
