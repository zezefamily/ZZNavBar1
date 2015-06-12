//
//  ViewController.m
//  ZZNavBar
//
//  Created by zezefamily on 15/6/10.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ViewController.h"
#import "ZZNavBar.h"

@interface ViewController ()
@property (nonatomic,strong) ZZNavBar *zznavBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.zznavBar = [[ZZNavBar alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
    [self.view addSubview:self.zznavBar];
    
    
    self.zznavBar.blockText = ^(NSString *text){
    
        NSLog(@"text == %@",text);
        
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
