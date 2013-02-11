//
//  DataManager.m
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import "DataManager.h"

@implementation DataManager

- (id)init {
    self = [super init];
    if (self) {
        // create CoreData classes
        self.logStorage = [[LogStorage alloc] init];
    }
    return self;
}


@end
