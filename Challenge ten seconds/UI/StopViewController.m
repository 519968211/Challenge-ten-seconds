//
//  StopViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "StopViewController.h"
#import "UIColor+WIT.h"
#import "SuccessViewController.h"
#import "FailureViewController.h"

@interface StopViewController ()

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, retain) UIView *container;
@property (nonatomic, retain) UIButton *stopButton;

@end

@implementation StopViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#222831"];
    
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(11*scale, kTopHeight+81*scale, 353*scale, 140*scale)];
    container.backgroundColor = [UIColor colorWithHexString:@"#111419"];
    container.layer.cornerRadius = 5*scale;
    [self.view addSubview:container];
    self.container = container;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0*scale, 16*scale, 353*scale, 109*scale)];
    label1.font = [UIFont fontWithName:@"20SEVEN" size:126*scale];
    label1.textColor = self.view.backgroundColor;
    label1.text = @"88,88";
    label1.textAlignment = NSTextAlignmentCenter;
    [container addSubview:label1];
    
    CGSize size = [label1.text sizeWithFont:label1.font];
    _originX = (container.frame.size.width-size.width)/2.0;
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    okButton.frame = CGRectMake(124*scale, kTopHeight+354*scale, 127*scale, 127*scale);
    okButton.layer.cornerRadius = 63.5*scale;
    okButton.layer.masksToBounds = YES;
    okButton.backgroundColor = [UIColor clearColor];
    okButton.titleLabel.font = [UIFont fontWithName:@"contania" size:30*scale];
    [okButton setBackgroundImage:[UIImage imageNamed:@"btn_stop"] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton];
    self.stopButton = okButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _time = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
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
- (void)back
{
    [_timer invalidate];
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

- (void)countTime
{
    _time += 0.01;
    NSString *timeString = [NSString stringWithFormat:@"%0.2f",_time];
    if(_time>=[[NSUserDefaults standardUserDefaults] doubleForKey:@"difficulty"]+3)
    {
        [self stop];
    }
    
    [[_container viewWithTag:10] removeFromSuperview];
    [[_container viewWithTag:11] removeFromSuperview];
    [[_container viewWithTag:12] removeFromSuperview];
    [[_container viewWithTag:13] removeFromSuperview];
    [[_container viewWithTag:14] removeFromSuperview];
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@","];
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    UIFont *font = [UIFont fontWithName:@"20SEVEN" size:126*scale];
    for(int i=0;i<timeString.length;i++)
    {
        CGSize size1 = [[@"88,88" substringToIndex:5-timeString.length+i] sizeWithFont:font];
        CGFloat oneNumberWidth = [@"8" sizeWithFont:font].width;
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(_originX+size1.width, 16*scale, oneNumberWidth, 109*scale)];
        label1.font = [UIFont fontWithName:@"20SEVEN" size:126*scale];
        label1.textColor = [UIColor colorWithHexString:@"#FD7013"];
        label1.text = [timeString substringWithRange:NSMakeRange(i, 1)];
        label1.textAlignment = NSTextAlignmentRight;
        if([label1.text isEqualToString:@","])
        {
            label1.textAlignment = NSTextAlignmentLeft;
        }
        label1.tag = 10+i;
        [_container addSubview:label1];
    }
}

- (void)stop
{
    self.stopButton.enabled = NO;
    [_timer invalidate];
    [self performSelector:@selector(nextVC) withObject:nil afterDelay:1.5];
}

- (void)nextVC
{
    if(_time==[[NSUserDefaults standardUserDefaults] doubleForKey:@"difficulty"])
    {
        SuccessViewController *vc = [[SuccessViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        FailureViewController *vc = [[FailureViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
