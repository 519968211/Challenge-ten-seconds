//
//  SuccessViewController.m
//  Challenge ten seconds
//
//  Created by 519968211 on 2019/7/19.
//  Copyright © 2019 519968211. All rights reserved.
//

#import "SuccessViewController.h"
#import "UIColor+WIT.h"
#import "CoreTextArcView.h"

@interface SuccessViewController ()

@property (nonatomic, retain) CAEmitterLayer *streamerEmitter;
@property (nonatomic, retain) CoreTextArcView *arcView1;
@property (nonatomic, retain) CoreTextArcView *arcView2;

@end

@implementation SuccessViewController

- (void)loadView
{
    self.title = @"Challenge ten seconds";
    [super loadView];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.hidesBackButton = YES;
    
    CGFloat scale = [[UIScreen mainScreen] bounds].size.width/375.0;
    
    /*
    _arcView1 = [[CoreTextArcView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+27*scale, 263*scale, 500*scale)
                                                 font:[UIFont fontWithName:@"contania" size:56*scale]
                                                 text:[@"Challenge" uppercaseString]
                                               radius:250*scale
                                              arcSize:60
                                                color:[UIColor colorWithHexString:@"#FFD204"]];
    _arcView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_arcView1];
    
    _arcView2 = [[CoreTextArcView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+27*scale, 263*scale, 500*scale)
                                                  font:[UIFont fontWithName:@"contania" size:56*scale]
                                                  text:[@"success" uppercaseString]
                                                radius:130*scale
                                               arcSize:60
                                                 color:[UIColor colorWithHexString:@"#FFD204"]];
    _arcView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_arcView2];
     */
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(56*scale, kTopHeight+107*scale, 262*scale, 121*scale)];
    imageView1.image = [UIImage imageNamed:@"Challengesuccess"];
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
    
    [self startAnimation];
}

- (void)startAnimation
{
    //设置发射器
    _streamerEmitter = [[CAEmitterLayer alloc] init];
    _streamerEmitter.emitterPosition=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    _streamerEmitter.emitterSize = CGSizeMake(self.view.frame.size.width-100, 20);
    _streamerEmitter.renderMode = kCAEmitterLayerAdditive;
    _streamerEmitter.preservesDepth = YES;
    
    //发射单元
    //彩带
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.birthRate = 100;
    smoke.lifetime = 3.0;
    smoke.lifetimeRange = 1;
    smoke.scale = 0.5;
    smoke.scaleRange = 0.5;
    smoke.color = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.2].CGColor;
    smoke.alphaRange = 1;
    smoke.redRange = 255;
    smoke.blueRange = 22;
    smoke.greenRange = 1.5;
    smoke.contents = (id)[[UIImage imageNamed:@"彩花.png"] CGImage];
    [smoke setName:@"smoke"];
    
    smoke.velocity = 200;
    smoke.velocityRange = 50;
    smoke.emissionLongitude = M_PI+M_PI_2;
    smoke.emissionRange = M_PI_2;
    smoke.spin = M_PI_2;
    smoke.spinRange = M_PI_2;
    
    _streamerEmitter.emitterCells = [NSArray arrayWithObjects:smoke,nil];
    [self.view.layer addSublayer:_streamerEmitter];
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
