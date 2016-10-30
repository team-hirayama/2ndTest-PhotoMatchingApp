//
//  MainViewController.m
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "APIAcceccObject.h"
#import "MainViewController.h"
#import "Photo.h"
#import "ResultTableViewCell.h"

@interface MainViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITextField *searchTextField;
@property (nonatomic, weak) NSMutableArray<Photo *> *photos;

@end

@implementation MainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Actions

- (IBAction)searchButton:(UIButton *)sender {
    if (self.searchTextField.text.length == 0) return;
    [self getConnection];
}


#pragma mark - Public


#pragma mark - Private

/**
 *  通信を確立する
 */
- (void) getConnection {
    APIAcceccObject *access = [APIAcceccObject new];
    
    // ネットワークを確かめる
    if ([access isSuccessedinConnectiog]) {
        
        // API取得
        [access getJsonData:self.searchTextField.text];
        self.photos = access.photos;
        NSLog(@"%@", self.photos);
    
    } else {
        NSLog(@"Not connection");
    }

}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"resultCell";
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:identifier];
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:self.photos[indexPath.row].url];
    cell.resultPhotoImageView.image = [UIImage imageWithData:imageData];
    return cell;

}


#pragma mark - UITableViewDelegate




@end
