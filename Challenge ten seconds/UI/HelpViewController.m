//
//  ViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "HelpViewController.h"
#import "UIColor+WIT.h"
#import "DifficultyViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#222831"];
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(38*scale, kTopHeight+82*scale, 300*scale, 300*scale)];
    border.layer.cornerRadius = 5*scale;
    border.layer.borderColor = [[UIColor colorWithHexString:@"#FD7013"] CGColor];
    border.layer.borderWidth = 1;
    [self.view addSubview:border];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(92.5*scale, kTopHeight+70*scale, 190*scale, 24*scale)];
    label1.font = [UIFont fontWithName:@"contania" size: 30*scale];
    label1.textColor = [UIColor colorWithHexString:@"#FD7013"];
    label1.text = @"HOW TO PLAY";
    label1.backgroundColor = self.view.backgroundColor;
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(54*scale, kTopHeight+118*scale, 267*scale, 243*scale)];
    label2.font = [UIFont fontWithName:@"STYuanti-SC-Regular" size:24*scale];
    label2.textColor = [UIColor colorWithRed:136/255.0 green:157/255.0 blue:192/255.0 alpha:1.0];
    label2.text = @"Select the number of challenges, then click to start the challe. When the number is close to the number you selected, press the stop button quickly.";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.numberOfLines = 0;
    [self.view addSubview:label2];
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    okButton.frame = CGRectMake(113*scale, kTopHeight+429*scale, 150*scale, 50*scale);
    okButton.layer.cornerRadius = 25*scale;
    okButton.layer.masksToBounds = YES;
    okButton.backgroundColor = [UIColor colorWithRed:253/255.0 green:112/255.0 blue:19/255.0 alpha:1.0];
    okButton.titleLabel.font = [UIFont fontWithName:@"contania" size:30*scale];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(OK) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - actions
- (void)OK
{
    DifficultyViewController *vc = [[DifficultyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
