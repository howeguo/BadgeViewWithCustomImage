//
//  ViewController.m
//  BadgeViewWithImage
//
//  Created by shihaoguo on 4/12/14.
//  Copyright (c) 2014 shihaoguo. All rights reserved.
//

#import "ViewController.h"
#import "BadgeView.h"
@interface ViewController ()
{
    BadgeView *_homeBadge;
    BadgeView *_letterBadge;
    BadgeView *_letterBadge1;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn= [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [btn setImage:[UIImage imageNamed:@"letter"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    _homeBadge=[[BadgeView alloc] initWithFrame:CGRectMake(50, 25, 30, 25)];

    _homeBadge.badgeValue=@"9";
    [btn addSubview:_homeBadge];
    
    
    UIButton *btn1= [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
    [btn1 setImage:[UIImage imageNamed:@"letterSelected"] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    _letterBadge=[[BadgeView alloc] initWithFrame:CGRectMake(50, 0, 30, 25)];
    _letterBadge.badgeValue=@"99";
    [btn1 addSubview:_letterBadge];
    UIButton *btn2= [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 50)];
    [btn2 setImage:[UIImage imageNamed:@"letterSelected"] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    _letterBadge1=[[BadgeView alloc] initWithFrame:CGRectMake(50, 0, 30, 25)];
    _letterBadge1.badgeValue=@"111";
    [btn2 addSubview:_letterBadge1];
    
    UIButton *btn3= [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 80, 30)];
    [btn3 setTitle:@"增加数量" forState:UIControlStateNormal];
    btn3.backgroundColor=[UIColor purpleColor];
    [btn3 addTarget:self action:@selector(addBadgeNum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4= [[UIButton alloc] initWithFrame:CGRectMake(200, 320, 80, 30)];
    [btn4 setTitle:@"减少数量" forState:UIControlStateNormal];
    btn4.backgroundColor=[UIColor blueColor];
    [btn4 addTarget:self action:@selector(clearBadgeNum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
}
- (void) addBadgeNum
{
    NSInteger num=[_homeBadge.badgeValue intValue];
    num++;
    _homeBadge.badgeValue=[NSString stringWithFormat:@"%d",num];
}
- (void) clearBadgeNum
{
    NSInteger paramNum=5;
    NSInteger num=[_letterBadge.badgeValue integerValue];
    if (num>paramNum) {
        _letterBadge.badgeValue=[NSString stringWithFormat:@"%d",(num-paramNum)];
    }else{
        _letterBadge.badgeValue=NULL;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
