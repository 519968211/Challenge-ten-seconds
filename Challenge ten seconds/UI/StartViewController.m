//
//  StartViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "StartViewController.h"
#import "UIColor+WIT.h"
#import "ThreeViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#222831"];
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0*scale, kTopHeight+168*scale, 375*scale, 24*scale)];
    label1.font = [UIFont fontWithName:@"contania" size: 30*scale];
    label1.textColor = [UIColor colorWithHexString:@"#FD7013"];
    label1.text = [@"are you ready ?" uppercaseString];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    okButton.frame = CGRectMake(124*scale, kTopHeight+354*scale, 127*scale, 127*scale);
    okButton.layer.cornerRadius = 63.5*scale;
    okButton.layer.masksToBounds = YES;
    okButton.backgroundColor = [UIColor clearColor];
    okButton.titleLabel.font = [UIFont fontWithName:@"contania" size:30*scale];
    [okButton setBackgroundImage:[UIImage imageNamed:@"btn_start"] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action
- (void)start
{
    ThreeViewController *vc = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
