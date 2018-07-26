//
//  SettingTableViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/15.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *accountSafe;
@property (weak, nonatomic) IBOutlet UILabel *remind;
@property (weak, nonatomic) IBOutlet UILabel *language;
@property (weak, nonatomic) IBOutlet UILabel *userGider;
@property (weak, nonatomic) IBOutlet UILabel *aboutUs;
@property (weak, nonatomic) IBOutlet UILabel *version;
@property (weak, nonatomic) IBOutlet UILabel *quit;
@property (weak, nonatomic) IBOutlet UILabel *labelVersion;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelVersion.text = [NSString stringWithFormat:@"V-%@",APP_VERSION];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 "账号与安全" = "账号与安全";
 "提醒设置" = "提醒设置";
 "多语言" = "多语言";
 "用户指南" = "用户指南";
 "关于我们" = "关于我们";
 "版本号" = "版本号";
 "退出登录" = "退出登录";

 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = CustomStr(@"SetingVcTitle");
    self.accountSafe.text = CustomStr(@"countSafe");
    self.remind.text = CustomStr(@"提醒设置");
    self.language.text = CustomStr(@"多语言");
    self.userGider.text = CustomStr(@"用户指南");
    self.aboutUs.text = CustomStr(@"关于我们");
    self.version.text = CustomStr(@"版本号");
    self.quit.text = CustomStr(@"退出登录");
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

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
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

 
    
}
@end
