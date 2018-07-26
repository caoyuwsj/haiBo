//
//  BasicInfoTableViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/12.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "BasicInfoTableViewController.h"
#import "PhotoImageView.h"
#import "CGXPickerView.h"
@interface BasicInfoTableViewController ()
@property (weak, nonatomic) IBOutlet PhotoImageView *photoImg;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *registerTime;
@property (weak, nonatomic) IBOutlet UILabel *phoneNo;
@property (strong , nonatomic) UIImage * imgPhoto;

@end

@implementation BasicInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.photoImg.layer.cornerRadius = self.photoImg.bounds.size.height/2;
    self.photoImg.layer.masksToBounds = YES;
    WeakSelf;
    self.photoImg.finishedBlock = ^(UIImageView* imgV , UIImage *img){
        imgV.image = img;
        weakSelf.imgPhoto = img;
        [weakSelf upLoadImg];
    };
    
    self.photoImg.image = self.imgHead;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    self.userName.text = USER.person.nickname;
    self.sex.text = USER.person.sex.integerValue == 1 ? @"男":@"女";
    
    self.birthday.text = USER.person.birthday;
    self.phoneNo.text = USER.person.phone;
    
}
#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
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

-(void)upLoadImg{
    NSDictionary* dic = @{
                          @"sid": USER.sid,
                          @"type": @"avatar"
                          };
    
    NSArray* imgArray = @[self.imgPhoto ];
    NSArray* nameArray = @[@"value"];
    [GXNetWorking gxPostImgWithUrl:API_UpdateInfo mustParameters:dic imgs:imgArray nameArray:nameArray success:^(BOOL succeed , NSString* msg , NSString* code , id obj){
        if (succeed) {
            USER.imgHead = self.imgPhoto;
        }else{
                    TOAST(msg);
        }
    } viewController:self];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"gotoEditeName"]) {
        [[segue destinationViewController] setValue:self.userName.text forKey:@"preName"];
    }
}

-(void)chooseSex{
    NSArray* array = @[@"女",@"男"];
    [CGXPickerView showStringPickerWithTitle:@" " DataSource:array DefaultSelValue:array[0] IsAutoSelect:NO Manager:nil ResultBlock:^(id selectValue, id selectRow) {
        //          NSLog(@"%@  %@",selectValue , selectRow);
        self.sex.text = selectValue;
        [self upDateInfo:@{@"type": @"sex",
                           @"value" :  [NSString stringWithFormat:@"%@",selectRow]
                           }];
    }];
}
-(void)chooseBirthday{
    [CGXPickerView showDatePickerWithTitle:@"" DateType:UIDatePickerModeDate DefaultSelValue:@"" MinDateStr:nil MaxDateStr:nil IsAutoSelect:NO Manager:nil ResultBlock:^(NSString* s){
        self.birthday.text = s;
        [self upDateInfo:@{@"type": @"birthday",
                           @"value" :  [NSString stringWithFormat:@"%@",s]
                           }];

    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 2) {
        [self chooseSex];
    }else if(indexPath.section == 1){
        [self chooseBirthday];
    }
    
    
}

-(void)upDateInfo:(NSDictionary*)dic{
    
    NSMutableDictionary* mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [mDic setObject:USER.sid forKey:@"sid"];
    
    [GXNetWorking gxPostWithUrl:API_UpdateInfo mustParameters:mDic success:^(BOOL succeed , NSString* msg , NSString* code , id obj){
        if (succeed) {
            if ([dic[@"type"] isEqualToString:@"sex"]) {
                USER.person.sex = dic[@"value"];
            }else if([dic[@"type"] isEqualToString:@"birthday"]){
                USER.person.birthday = dic[@"value"];
            }
        }else{
            TOAST(msg);
        }
    } viewController:self];
}
@end
