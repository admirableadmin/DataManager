//
//  DataManager.h
//  DataManager
//
//  Created by Andreas Peichert on 2/8/13.
//
//

#import <Foundation/Foundation.h>
#import "LogStorage.h"

@interface DataManager : NSObject

/**
 The LogStorage, which is responsable for handling log data.
 */
@property (nonatomic, strong) LogStorage *logStorage;

@end
