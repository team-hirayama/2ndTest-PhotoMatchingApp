//
//  Photo.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/30.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "Photo.h"
#import <Foundation/Foundation.h>

@interface Photo : NSObject
@property (nonatomic, weak) NSString *farmId;
@property (nonatomic, weak) NSString *serverId;
@property (nonatomic, weak) NSString *photoId;
@property (nonatomic, weak) NSString *secretId;
@property (nonatomic, weak) NSString *owner;
@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSURL *url;

@end
