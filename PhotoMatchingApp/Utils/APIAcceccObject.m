//
//  APIAcceccObject.m
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "APIAcceccObject.h"
#import "AFNetworking.h"
#import "Constants.h"

@implementation APIAcceccObject

- (BOOL)isSuccessedinConnectiog {
    return YES;
}


- (void)getJsonData:(NSString *)keyword {
    NSDictionary *parameters = @{@"api_key":STRING_API_KEY,
//                                 @"text":keyword,
                                 @"text":@"food",
                                 @"per_page":@"50"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager GET:STRING_API_URL
      parameters:parameters
         success:^(NSURLSessionDataTask *task, id responseObject) {
             if (!responseObject) return ;
             NSLog(@"%@", responseObject);
             NSData *dataXml = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
             NSXMLParser *parser = [[NSXMLParser alloc] initWithData:dataXml];
//             xmlParser.delegate = self;
////             [parser setDelegate:self];
////             [parser parse];
//             NSLog(@"Task: %@, XMLParser: %@", task, str);
//             NSDictionary *dataDctionaries = (NSDictionary *)responseObject;
//             [self mapWithXML:dataDctionaries];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error){
             NSLog(@"Erroe: %@", error);
         }];
}

- (Photo *)mapWithXML:(NSDictionary *)response {
    Photo *photo = [Photo new];
    
    //stat: fail or success
    
    NSLog(@"response: %@", response);
    return photo;
}

@end
