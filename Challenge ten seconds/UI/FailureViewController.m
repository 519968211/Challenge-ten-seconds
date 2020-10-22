//
//  FailureViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "FailureViewController.h"
#import "UIColor+WIT.h"
#import "CoreTextArcView.h"

@interface FailureViewController ()

@end

@implementation FailureViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.hidesBackButton = YES;
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    /*
    CoreTextArcView *_arcView1 = [[CoreTextArcView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+27*scale, 263*scale, 500*scale)
                                                  font:[UIFont fontWithName:@"contania" size:56*scale]
                                                  text:[@"Challenge" uppercaseString]
                                                radius:250*scale
                                               arcSize:60
                                                 color:[UIColor whiteColor]];
    _arcView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_arcView1];
    
    CoreTextArcView *_arcView2 = [[CoreTextArcView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+27*scale, 263*scale, 500*scale)
                                                  font:[UIFont fontWithName:@"contania" size:56*scale]
                                                  text:[@"failure" uppercaseString]
                                                radius:130*scale
                                               arcSize:60
                                                 color:[UIColor whiteColor]];
    _arcView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_arcView2];
     */
     
     UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+107*scale, 262*scale, 121*scale)];
     imageView1.image = [UIImage imageNamed:@"Challengefailure"];
     [self.view addSubview:imageView1];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(112.5*scale, kTopHeight+340*scale, 150*scale, 50*scale);
    button1.layer.cornerRadius = 25*scale;
    button1.layer.masksToBounds = YES;
    button1.backgroundColor = [UIColor colorWithHexString:@"#3CB91A"];
    button1.titleLabel.font = [UIFont fontWithName:@"contania" size:30*scale];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitle:@"AGAIN" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(again) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(112.5*scale, kTopHeight+428*scale, 150*scale, 50*scale);
    button2.layer.cornerRadius = 25*scale;
    button2.layer.masksToBounds = YES;
    button2.backgroundColor = [UIColor colorWithHexString:@"#FD7013"];
    button2.titleLabel.font = [UIFont fontWithName:@"contania" size:30*scale];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitle:@"MENU" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
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

- (void)again
{
    UINavigationController *nav = self.navigationController;
    for(UIViewController *vc in nav.viewControllers)
    {
        if([NSStringFromClass(vc.class) isEqualToString:@"ThreeViewController"])
        {
            [nav popToViewController:vc animated:YES];
            break;
        }
    }
}

- (void)menu
{
    UINavigationController *nav = self.navigationController;
    for(UIViewController *vc in nav.viewControllers)
    {
        if([NSStringFromClass(vc.class) isEqualToString:@"DifficultyViewController"])
        {
            [nav popToViewController:vc animated:YES];
            break;
        }
    }
}

@end
