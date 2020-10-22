//
//  DifficultyViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "DifficultyViewController.h"
#import "UIColor+WIT.h"
#import "StartViewController.h"

@interface DifficultyViewController ()

@end

@implementation DifficultyViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#222831"];
    self.navigationItem.hidesBackButton = YES;
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+65*scale, 263*scale, 64*scale)];
    label1.font = [UIFont fontWithName:@"contania" size: 30*scale];
    label1.textColor = [UIColor colorWithHexString:@"#FD7013"];
    label1.text = [@"Select the number of challenges" uppercaseString];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.numberOfLines = 0;
    [self.view addSubview:label1];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(62.5*scale, kTopHeight+161*scale, 250*scale, 50*scale);
    button1.layer.cornerRadius = 25*scale;
    button1.layer.masksToBounds = YES;
    button1.backgroundColor = [UIColor colorWithRed:253/255.0 green:112/255.0 blue:19/255.0 alpha:1.0];
    button1.titleLabel.font = [UIFont fontWithName:@"contania" size:36*scale];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitle:@"10.00’’" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(62.5*scale, kTopHeight+236*scale, 250*scale, 50*scale);
    button2.layer.cornerRadius = 25*scale;
    button2.layer.masksToBounds = YES;
    button2.backgroundColor = [UIColor colorWithHexString:@"#FD13BE"];
    button2.titleLabel.font = [UIFont fontWithName:@"contania" size:36*scale];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitle:@"05.20’’" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(62.5*scale, kTopHeight+311*scale, 250*scale, 50*scale);
    button3.layer.cornerRadius = 25*scale;
    button3.layer.masksToBounds = YES;
    button3.backgroundColor = [UIColor colorWithHexString:@"#FD4513"];
    button3.titleLabel.font = [UIFont fontWithName:@"contania" size:36*scale];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setTitle:@"07.07’’" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(62.5*scale, kTopHeight+386*scale, 250*scale, 50*scale);
    button4.layer.cornerRadius = 25*scale;
    button4.layer.masksToBounds = YES;
    button4.backgroundColor = [UIColor colorWithHexString:@"#139DFD"];
    button4.titleLabel.font = [UIFont fontWithName:@"contania" size:36*scale];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setTitle:@"11.11’’" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(62.5*scale, kTopHeight+461*scale, 250*scale, 50*scale);
    button5.layer.cornerRadius = 25*scale;
    button5.layer.masksToBounds = YES;
    button5.backgroundColor = [UIColor colorWithHexString:@"#9213FD"];
    button5.titleLabel.font = [UIFont fontWithName:@"contania" size:36*scale];
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button5 setTitle:@"13.14’’" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
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
- (void)buttonPress:(UIButton *)sender
{
    NSString *string = [sender currentTitle];
    string = [[string componentsSeparatedByString:@"’’"] firstObject];
    [[NSUserDefaults standardUserDefaults] setDouble:string.doubleValue forKey:@"difficulty"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    StartViewController *vc = [[StartViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
    

@end
