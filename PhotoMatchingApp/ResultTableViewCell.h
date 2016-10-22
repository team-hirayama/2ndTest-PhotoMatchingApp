//
//  ResultTableViewCell.h
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *resultPhotoImageView;

@end
