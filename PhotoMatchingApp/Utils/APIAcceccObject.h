//
//  APIAcceccObject.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "Photo.h"
#import <Foundation/Foundation.h>

@interface APIAcceccObject : NSObject
- (BOOL)isSuccessedinConnectiog;
- (void)getJsonData:(NSString *)keyword;

@end
