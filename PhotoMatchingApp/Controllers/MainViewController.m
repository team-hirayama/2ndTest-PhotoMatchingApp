//
//  MainViewController.m
//  PhotoMatchingApp
//
//  Created by NishiokaKohei on 2016/10/22.
//  Copyright © 2016年 Kohey. All rights reserved.
//

#import "APIAcceccObject.h"
#import "MainViewController.h"
#import "blog.h"
#import "ResultTableViewCell.h"

@interface MainViewController () <UITableViewDataSource,UITableViewDelegate,APIAcceccObjectDelegate>
@property (nonatomic, weak) IBOutlet UITextField *searchTextField;
@property (nonatomic, weak) IBOutlet UITableView *resultTableView;
@property (nonatomic, weak) APIAcceccObject *access;
@property (nonatomic, weak) NSMutableArray<Blog *> *blogs;
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
        access.delegate = self;
        [access getJsonData:self.searchTextField.text];
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
    
    NSData *imageData = [NSData dataWithContentsOfURL:self.blogs[indexPath.row].url];
    cell.resultPhotoImageView.image = [UIImage imageWithData:imageData];
    return cell;

}


#pragma mark - UITableViewDelegate

#pragma mark - APIAcceccObjectDelegate

- (void) returnWithBlog:(NSMutableArray<Blog*> *)results {
    self.blogs = self.access.blogs;
    NSLog(@"%@", self.blogs);
    [self.resultTableView reloadData];
}


@end
