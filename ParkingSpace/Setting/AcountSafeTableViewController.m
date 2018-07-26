//
//  AcountSafeTableViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/20.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "AcountSafeTableViewController.h"

@interface AcountSafeTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *emailStatus;
@property (weak, nonatomic) IBOutlet UILabel *realName;
@property (weak, nonatomic) IBOutlet UILabel *changePassword;
@property (strong , nonatomic) NSString* type;



@property (weak, nonatomic) IBOutlet UILabel *labelPhoneNo;

@end

@implementation AcountSafeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localLanguageChanged:) name:ChangeLang object:nil];
    
}
/*
 "手机号码" = "手机号码";
 "绑定邮箱" = "绑定邮箱";
 "未绑定" = "未绑定";
 "实名认证" = "实名认证";
 "修改支付密码" = "修改支付密码";
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = CustomStr(@"countSafe");
    self.phoneNum.text = CustomStr(@"手机号码");
    self.email.text = CustomStr(@"绑定邮箱");
    self.emailStatus.text = CustomStr(@"未绑定");
    self.realName.text = CustomStr(@"实名认证");
    self.changePassword.text = CustomStr(@"修改支付密码");
    
    
    self.labelPhoneNo.text = USER.person.phone.length  > 3 ? USER.person.phone : CustomStr(@"未绑定");
    self.emailStatus.text = USER.person.email.length > 3 ? USER.person.email:CustomStr(@"未绑定");
}
#pragma mark -
-(void)localLanguageChanged:(NSNotification *)noti
{
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

 

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     if ([segue.identifier isEqualToString:@"gotoEditePhone"]) {
         [[segue destinationViewController] setValue:self.type forKey:@"type"];
     }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //修改手机号&邮箱
    if (indexPath.row == 0  || indexPath.row == 1) {
        self.type = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        [self performSegueWithIdentifier:@"gotoEditePhone" sender:self];
    }
    
    //实名认证
    if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"gotoRealNameCenter" sender:self];
    }
}
@end
