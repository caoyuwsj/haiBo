//
//  RealNameTableViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/11.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//
#import "MyButton.h"
#import "RealNameTableViewController.h"
#import "PhotoImageView.h"

#define CELL_HEIGHT  (125/375*SCREEN_WIDTH)


@interface RealNameTableViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *footView;
@property (assign , nonatomic) int photoType;
@property (weak, nonatomic) IBOutlet PhotoImageView *imgvFront;
@property (weak, nonatomic) IBOutlet PhotoImageView *imgvBack;
@property (weak, nonatomic) IBOutlet PhotoImageView *imgvHand;
@property (weak, nonatomic) IBOutlet MyButton *commitBtn;

@property (weak, nonatomic) IBOutlet UITextField *textfName;
@property (weak, nonatomic) IBOutlet UITextField *textfIdNo;

@property (strong , nonatomic) NSData* imgPositive; //证明
@property (strong , nonatomic) NSData* imgOpposite; //反面
@property (strong , nonatomic) NSData* handImgPositive; //手持

@property (assign , nonatomic) BOOL isPic1;
@property (assign , nonatomic) BOOL isPic2;
@property (assign , nonatomic) BOOL isPic3;

@property (strong , nonatomic) UIImage* Pic1;
@property (strong , nonatomic) UIImage* Pic2;
@property (strong , nonatomic) UIImage* Pic3;


@end

@implementation RealNameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.commitBtn disable];
    
#ifdef TEST
//    USER.sid = @"09c30c1dcbc814e95b1a674407535fd3940acf6075343e141e03724bc5c2c345";
//    USER.userkey = @"1c21f7d9429649f52ddbc021861cd4997e49f6b3";
#endif
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tableView.tableHeaderView = self.topView;
//    self.tableView.tableFooterView = self.footView;
    
    WeakSelf;
    self.imgvFront.finishedBlock = ^(UIImageView* imgView , UIImage* img){
        imgView.image = img;
        weakSelf.isPic1 = YES;
        weakSelf.Pic1 = img;
        [weakSelf dealBtnStatus];
    };
    self.imgvBack.finishedBlock = ^(UIImageView* imgView , UIImage* img){
        imgView.image = img;
        weakSelf.isPic2 = YES;
        weakSelf.Pic2 = img;
        [weakSelf dealBtnStatus];
    };
    self.imgvHand.finishedBlock=^(UIImageView* imgView , UIImage* img){
        imgView.image = img;
        weakSelf.isPic3 = YES;
        weakSelf.Pic3 = img;
        [weakSelf dealBtnStatus];
    };
    
//    [self.commitBtn disable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)takePhoto:(int)type
{
    self.photoType = type;

}
#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }
    
    return 5;
}
 
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 3;
//}

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
- (IBAction)editChanged:(id)sender {
    [self dealBtnStatus];
}
-(void)dealBtnStatus{
    if (self.isPic1 && self.isPic2 && self.isPic3 && self.textfIdNo.text.length>10 && self.textfName.text.length>1) {
        [self.commitBtn enable];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)gotoNextView:(id)sender {
    
    NSDictionary* dic = @{
                          @"sid":USER.sid,
                          @"truename": self.textfName.text,
                          @"idnumber": self.textfIdNo.text
//                          @"imgPositive": UIImagePNGRepresentation(self.imgvFront.image),
//                          @"imgOpposite": UIImagePNGRepresentation(self.imgvBack.image),
//                          @"handImgPositive": UIImagePNGRepresentation(self.imgvHand.image)
                          };
    
    NSArray* imgArray = @[self.Pic1 ,self.Pic2 ,self.Pic3 ];
    NSArray* nameArray = @[@"imgPositive",@"imgOpposite",@"handImgPositive"];
    [GXNetWorking gxPostImgWithUrl:API_RealName mustParameters:dic imgs:imgArray nameArray:nameArray success:^(BOOL succeed , NSString* msg , NSString* code , id obj){
        if (succeed) {
            [self performSegueWithIdentifier:@"gotoResult" sender:self];
//            [self performSelector:@selector(gotoNextVc) withObject:nil afterDelay:1];
        }else{
            
        }
        TOAST(msg);
    } viewController:self];
}
-(void)gotoNextVc{
    
}
@end
