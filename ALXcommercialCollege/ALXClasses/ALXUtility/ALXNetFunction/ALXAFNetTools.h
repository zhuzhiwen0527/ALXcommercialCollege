//
//  ALXAFNetTools.h
//  ALXcommercialCollege
//
//  Created by macbook pro on 16/7/20.
//  Copyright © 2016年 zzw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALXURLHeader.h"
typedef void(^successBlock) (id responsData);
typedef void(^failedBlock) (NSError * error);
@interface ALXAFNetTools : NSObject

+ (ALXAFNetTools *)share;

- (void)GET:(NSString*)url success:(successBlock)successBlock failed:(failedBlock)failedBlock;

- (void)POST:(NSString*)url parameters:(id)parameters success:(successBlock)successBlock failed:(failedBlock)failedBlock;
@end
