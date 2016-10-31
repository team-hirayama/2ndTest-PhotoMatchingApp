//
//  APIAcceccObject.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "Blog.h"
#import "Photo.h"
#import <Foundation/Foundation.h>

@class APIAcceccObject;

@protocol APIAcceccObjectDelegate <NSObject>
@optional
- (void) returnWithBlog:(NSMutableArray<Blog*> *)results;

@end


@interface APIAcceccObject : NSObject <NSXMLParserDelegate>
@property (nonatomic, weak) Photo *photo;
@property (nonatomic, strong) NSMutableArray<Blog *> *blogs;
@property (nonatomic, weak) id<APIAcceccObjectDelegate> delegate;
- (BOOL)isSuccessedinConnectiog;
- (void)getJsonData:(NSString *)keyword;

@end

