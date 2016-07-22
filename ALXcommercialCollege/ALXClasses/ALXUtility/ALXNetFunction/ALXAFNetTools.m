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
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
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

        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
 
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (successBlock) {
            
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
          [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failedBlock) {
            
            failedBlock(error);
            
        }
    }];

}

- (void)POST:(NSString*)url parameters:(id)parameters success:(successBlock)successBlock failed:(failedBlock)failedBlock{

    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
  
    [session POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
   
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

           [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (successBlock) {
            
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
           [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"%@",error);
        if (failedBlock) {
            
            failedBlock(error);
        }
    }];
    
}

- (void)POST:(NSString *)url parameters:(id)parameters data:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)type progress:(progress)progress success:(successBlock)successBlock failed:(failedBlock)failedBlock{

  url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [session POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (successBlock) {
            
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"%@",error);
        if (failedBlock) {
            
            failedBlock(error);
        }
    }];



}

@end
