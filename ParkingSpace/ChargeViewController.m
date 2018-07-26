//
//  ChargeViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/11.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "ChargeViewController.h"
#import "WXApiRequestHandler.h"
#import "WXApiManager.h"
#import "WechatAuthSDK.h"
#import "PasswordView.h"
#import "LSRouter+AppDelegate.h"
@interface ChargeViewController ()
{
    
}
@property (assign , nonatomic) BOOL needCharge;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet MyButton *payBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgvCharge;
@property (weak, nonatomic) IBOutlet UILabel *textAmout;

@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.needCharge = YES;
    
    self.tableView.tableHeaderView = self.topView;
    
    self.infoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"黄色条背景"]];
    self.infoView.layer.cornerRadius = 10;
    self.infoView.layer.masksToBounds = YES;
    
    
    NSString* info = @"充值50元停车余额，即可快速享停车";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:info];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value: [UIColor redColor]
                    range:NSMakeRange(2, 3)];
    self.infoLabel.attributedText = attrStr;
    [_infoLabel sizeToFit];
    
 
    [self.payBtn setShortImg];
    self.imgvCharge.image = IMGSELECT;
    WeakSelf;
    [self.imgvCharge bk_whenTapped:^{
        if (weakSelf.needCharge) {
            weakSelf.imgvCharge.image = IMGUNSELECT;
            weakSelf.needCharge = NO;
            weakSelf.textAmout.text = @"100";
        }else{
            weakSelf.imgvCharge.image = IMGSELECT;
            weakSelf.needCharge = YES;
            weakSelf.textAmout.text = @"150";
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)pay:(id)sender {
    
    [LSRouter enterMainView];
    
    
    return;
    
    CGFloat viewHeight = 170;
    PasswordView* passv = [[PasswordView alloc] initWithFrame: CGRectMake(0, SCREEN_HEIGHT-viewHeight, SCREEN_WIDTH, viewHeight)];
    [passv showInView:CURRUNT_VC.view];
    passv.finishedBlock = ^(NSString* password){
        NSLog(@"password = %@",password);
    };
    
    
    
    
    return;
    //微信支付
    NSString *res = [WXApiRequestHandler jumpToBizPay];
    if( ![@"" isEqual:res] ){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"支付失败" message:res delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alter show];
    }
}

@end
