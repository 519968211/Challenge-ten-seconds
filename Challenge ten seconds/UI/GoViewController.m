//
//  GoViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "GoViewController.h"
#import "UIColor+WIT.h"
#import "StopViewController.h"

@interface GoViewController ()

@property (nonatomic, retain) UILabel *label1;

@end

@implementation GoViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#222831"];
    self.navigationItem.hidesBackButton = YES;
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0*scale, kTopHeight+121*scale, 375*scale, 248*scale)];
    label1.font = [UIFont fontWithName:@"contania" size:250*scale];
    label1.textColor = [UIColor colorWithHexString:@"#FD7013"];
    label1.text = @"GO";
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    self.label1 = label1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    __weak GoViewController *weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.label1.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
        weakSelf.label1.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self next];
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)next
{
    StopViewController *vc = [[StopViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
