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

/**
 *  Confirm the
 *
 *  @return BOOL -> YES if the network is on line, and NO if not available.
 */
- (BOOL)isSuccessedinConnectiog {
    return YES;
}


- (void)getJsonData:(NSString *)keyword {
    NSDictionary *parameters = @{@"method":@"flickr.photos.search",
                                 @"api_key":STRING_API_KEY,
                                 @"text":@"food",
                                 @"format":@"rest",
                                 @"per_page":@"50"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager GET:STRING_API_URL
      parameters:parameters
         success:^(NSURLSessionDataTask *task, id responseObject) {
             if (!responseObject) return ;
             [self beginParse:responseObject];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error){
             NSLog(@"Erroe: %@", error);
         }];
}


#pragma mark - Private

- (BOOL)beginParse:(id) xmlData {
    NSXMLParser *parser = (NSXMLParser *)xmlData;
    parser.delegate = self;
    if ([parser parse]) {
        // statement
    };
    return YES;
}

/**
 *  Fomulate a URL of photo data source.
 *
 *  @param photo, which is consisted with the datas parsed from Flickr.
 *
 *  @return String, which is
 */
- (NSString *)formulateWithPhoto:(Photo *)photo {
    return [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_m.jpg", photo.farmId, photo.serverId, photo.secretId];
}


#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
//    NSLog(@"解析開始");
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(nullable NSString *)namespaceURI
 qualifiedName:(nullable NSString *)qName
    attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {

    BOOL failure = [attributeDict[@"stat"] isEqualToString:@"fail"];
    if (failure) {
        NSLog(@"Fail");
        return;
    } else if ([elementName isEqualToString:@"photos"]) {
        NSLog(@"page: %@", attributeDict[@"page"]);
    } else if ([elementName isEqualToString:@"photo"]) {
        
        Photo *photo = [Photo new];
        photo.farmId = attributeDict[@"farm"];
        photo.photoId = attributeDict[@"id"];
        photo.secretId = attributeDict[@"secret"];
        photo.serverId = attributeDict[@"server"];
        photo.owner = attributeDict[@"owner"];
        photo.title = attributeDict[@"title"];
        
        NSString *urlString = [self formulateWithPhoto:photo];

        Blog *blog = [Blog new];
        blog.url = [NSURL URLWithString:urlString];
        blog.photo = photo;
        
        [self.blogs addObject:blog];
    }
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(nullable NSString *)namespaceURI
 qualifiedName:(nullable NSString *)qName {
    
//    NSLog(@"要素の終了タグを読み込んだ: %@",elementName);
    [self.delegate returnWithBlog:self.blogs];   //デリゲートメソッド
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
//    NSLog(@"parser :%@", string);
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
//    NSLog(@"解析終了");
}





@end
