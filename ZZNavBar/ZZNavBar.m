//
//  ZZNavBar.m
//  ZZNavBar
//
//  Created by zezefamily on 15/6/10.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ZZNavBar.h"
#import "DataView.h"
@interface ZZNavBar ()
{
    CGRect _frame;
}

@property (nonatomic,strong) NSMutableArray *btnArr;
@property (nonatomic,strong) DataView *dataView;

@end
@implementation ZZNavBar

static BOOL leftShow = YES;
static BOOL rightShow = YES;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        self.layer.masksToBounds = YES;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor grayColor];
        self.btnArr = [[NSMutableArray alloc]init];
        _frame = frame;
        [self createUI];
    
    }
    return self;
}


- (void)createUI
{
    //self.frame = CGRectMake(0, 0, _frame.size.width, _frame.size.height);
    NSArray *titleArr = @[@"left",@"right"];
    for(int i = 0; i< 2;i++){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*_frame.size.width/2, 0, _frame.size.width/2, _frame.size.height);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.backgroundColor = [UIColor yellowColor];
        button.tag = 400 + i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:button];
        
        [self.btnArr addObject:button];
    }
    
    self.dataView = [[DataView alloc]initWithFrame:CGRectMake(0, 30, _frame.size.width, 300)];
    [self addSubview:self.dataView];
    
    
    self.dataView.getText = ^(NSString *text) {
        
        //NSLog(@"text = %@",text);
        self.blockText(text);
        [self viewHidden];
        
    };
    
    
}
- (void)btnClick:(UIButton *)button
{
    //button.selected = YES;
    NSInteger tag = button.tag - 400;
    
    for(UIButton *selectBtn in self.btnArr){
        if(selectBtn == button){
            selectBtn.selected = YES;
        }else{
            selectBtn.selected = NO;
        }
    }
    
    if(tag == 0){
        if(leftShow == YES){
            [self viewShowWithHieght:340];
            [self leftisShow:NO rightIsShow:YES];
            
            
            
        }else {
            leftShow = YES;
            [self viewHidden];
            
            
            
            
        }
        
        
    }else if(tag == 1){
        if(rightShow){
            [self viewShowWithHieght:330];
            [self leftisShow:YES rightIsShow:NO];
            
            
            
        }else {
            rightShow = YES;
            [self viewHidden];
            
            
            
        }
        
        
    }
    
    
}


#pragma mark - 内部方法
- (void)viewShowWithHieght:(CGFloat)height
{
    [UIView animateWithDuration:.2 animations:^{
       self.frame = CGRectMake(0, 20, _frame.size.width, height);
        
    }];
}

- (void)viewHidden
{
    [UIView animateWithDuration:.2 animations:^{
        self.frame = CGRectMake(0, 20, _frame.size.width, 30);
        
    }];
    for(UIButton *btn in self.btnArr){
        btn.selected = NO;
    }
    leftShow = YES;
    rightShow = YES;
}

- (void)leftisShow:(BOOL)ls rightIsShow:(BOOL)rs;
{
    leftShow = ls;
    rightShow = rs;
}

@end
