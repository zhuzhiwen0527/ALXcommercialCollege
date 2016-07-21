//
//  ALXAFNetTools.m
//  ALXcommercialCollege
//
//  Created by macbook pro on 16/7/20.
//  Copyright © 2016年 zzw. All rights reserved.
//

#import "ALXAFNetTools.h"
@interface ALXAFNetTools ()
{
    AFHTTPSessionManager * session ;
}
@end
@implementation ALXAFNetTools

+ (ALXAFNetTools *)share{
    static ALXAFNetTools * tools = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!tools) {
            tools = [[ALXAFNetTools alloc] init];
        }
    });
    return tools;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        session = [AFHTTPSessionManager manager];
        
    }
    return self;
}

- (void)GET:(NSString*)url success:(successBlock)successBlock failed:(failedBlock)failedBlock{
    
   url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [session GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"----");
//        NSLog(@"%lld %lld",downloadProgress.totalUnitCount,downloadProgress.completedUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
 
        
        if (successBlock) {
            
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
       
        if (failedBlock) {
            
            failedBlock(error);
            
        }
    }];

}

- (void)POST:(NSString*)url parameters:(id)parameters success:(successBlock)successBlock failed:(failedBlock)failedBlock{

    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  
    [session POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
   
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        
        if (successBlock) {
            
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        if (failedBlock) {
            
            failedBlock(error);
        }
    }];
    
}

@end
