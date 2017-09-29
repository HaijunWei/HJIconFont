//
//  ViewController.m
//  HJIconFontDemo
//
//  Created by Haijun on 2017-07-17.
//  Copyright © 2017年 Haijun. All rights reserved.
//

#import "ViewController.h"
#import "HJIconFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 50)];
    label.font = [UIFont iconFontOfSize:20];
    label.text = @"\U0000e633 搜索";
    [self.view addSubview:label];
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, 100, 50)];
    NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithString:@"\U0000e633"
                                                                                   attributes:@{NSFontAttributeName:[UIFont iconFontOfSize:20], NSForegroundColorAttributeName:[UIColor redColor]}];
    [attributedStringM appendAttributedString:[[NSAttributedString alloc] initWithString:@"搜索"]];
    label1.attributedText = attributedStringM;
    [self.view addSubview:label1];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"扫码" forState:UIControlStateNormal];
    [button setImage:HJ_ICONFONT(@"\U0000e609", 20, nil) forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 160, 100, 50);
    [button1 setTitle:@"扫码" forState:UIControlStateNormal];
    [button1 setImage:[[HJIconFontManager sharedManager] fontImageWithUnicodeText:@"\U0000e609" size:20 color:[UIColor blackColor]] forState:UIControlStateNormal];
    [self.view addSubview:button1];
}

@end
