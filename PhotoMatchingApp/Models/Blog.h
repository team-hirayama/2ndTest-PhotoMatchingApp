//
//  Blog.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import <Realm/Realm.h>

@interface Blog : RLMObject
@property (nonatomic) NSInteger id;
@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *needspassword;
@property (nonatomic, weak) NSURL *url;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Blog>
RLM_ARRAY_TYPE(Blog)
