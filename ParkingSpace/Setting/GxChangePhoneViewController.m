//
//  GxChangePhoneViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "GxChangePhoneViewController.h"

@interface GxChangePhoneViewController ()
@property (weak, nonatomic) IBOutlet UIView *mView;
@property (weak, nonatomic) IBOutlet UILabel *lableTitle;

@end

@implementation GxChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mView.layer.cornerRadius = 8;
    _mView.layer.masksToBounds = YES;
    
    _mView.layer.shadowOffset = CGSizeMake(8, 8);
    _mView.layer.shadowOpacity = 0.8;
    _mView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    _mView.backgroundColor = [UIColor whiteColor];
    
    self.lableTitle.text = self.testS;
//    NSLog(@" 00  %@",self.testS);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeBtn:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
