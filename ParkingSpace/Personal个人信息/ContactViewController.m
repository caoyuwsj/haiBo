//
//  ContactViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/21.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnPhonne;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"400-1928-2191"];
    
    //设置下划线...
    /*
     NSUnderlineStyleNone                                    = 0x00, 无下划线
     NSUnderlineStyleSingle                                  = 0x01, 单行下划线
     NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
     */
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    //此时如果设置字体颜色要这样
    [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor]  range:NSMakeRange(0,[tncString length])];
    
    //设置下划线颜色...
    [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:(NSRange){0,[tncString length]}];
    [self.btnPhonne setAttributedTitle:tncString forState:UIControlStateNormal];
    
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
- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)contactus:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"拨打客服热线？" message:@"400-2131-2918" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", @"400-2131-2918"]]];
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
