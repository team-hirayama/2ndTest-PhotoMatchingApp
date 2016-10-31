//
//  Blog.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "Photo.h"

@interface Blog : NSObject
@property (nonatomic, weak) NSURL *url;
@property (nonatomic, weak) Photo *photo;
@end
