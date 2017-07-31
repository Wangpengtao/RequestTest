//
//  ViewController.m
//  PT_Client_HTTP
//
//  Created by 天蓝 on 2017/7/26.
//  Copyright © 2017年 PT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [PT_HTTP POST:kLoginAction parameters:nil success:^(NSDictionary *responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
