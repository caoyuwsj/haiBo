//
//  LanguageViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/21.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgCh;
@property (weak, nonatomic) IBOutlet UIImageView *imgEn;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = CustomStr(@"多语言");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:kSystemLocalLang] isEqualToString:@"en_US"]) {
        self.imgCh.image = self.imgEn.image;
        self.imgEn.image = [UIImage imageNamed:@"22"];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 /*
 本地语言环境保存沙河字
static NSString * const kSystemLocalLang = @"SystemLocalLang";

#define   kGetLocalLang  [[NSUserDefaults standardUserDefaults] objectForKey:kSystemLocalLang]
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString * langue = @"zh_CN";
    if (indexPath.row == 0) {
        langue = @"zh_CN";
        self.imgCh.image = [UIImage imageNamed:@"22"];
        self.imgEn.image = [UIImage imageNamed:@"没选中"];
    }else{
        langue = @"en_US";
        self.imgCh.image = [UIImage imageNamed:@"没选中"];
        self.imgEn.image = [UIImage imageNamed:@"22"];
    }
    BOOL needNoti = YES;
    if (!kGetLocalLang && [langue isEqualToString:@"zh_CN"])
    {
        needNoti = NO;
    }
    else if (kGetLocalLang && [kGetLocalLang isEqualToString:langue])
    {
        needNoti = NO;
    }
    else
    {
        needNoti = YES;
    }
    [[NSUserDefaults standardUserDefaults] setObject:langue forKey:kSystemLocalLang];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (needNoti)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:ChangeLang object:nil userInfo:@{ChangeLang:langue}];
        self.title = CustomStr(@"多语言");
    }
    
    
    
}
@end
