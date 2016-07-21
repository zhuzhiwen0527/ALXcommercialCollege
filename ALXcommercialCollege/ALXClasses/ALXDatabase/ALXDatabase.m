//
//  ALXDatabase.m
//  ALXcommercialCollege
//
//  Created by macbook pro on 16/7/20.
//  Copyright © 2016年 zzw. All rights reserved.
//

#import "ALXDatabase.h"
@interface ALXDatabase ()

@end
static FMDatabase * db = nil;
@implementation ALXDatabase

+ (void)sharedb{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!db) {
            db = [[FMDatabase alloc] initWithPath:[NSString stringWithFormat:@"%@/Documents/dataBase.sqlite",PATH_OF_APP_HOME]];
            [db open];
        }
    });
    
}



@end
