#import "CGXPickerView.h"
//
//  AdviceViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/18.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "AdviceViewController.h"

@interface AdviceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *adviceType;
@property (strong ,nonatomic) NSArray* array;
@end

@implementation AdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSArray*)array{
    if (!_array) {
        _array = @[@"停车问题",@"车场问题",@"态度问题",@"执法问题",@"APP问题",@"充值问题"];
    }
    return _array;
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
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        [self showAdviceType];
    }
}
-(void)showAdviceType{
    CGXPickerViewManager* manager = [CGXPickerViewManager new];
    manager.rightBtnBGColor = [UIColor whiteColor];
    manager.rightBtnborderColor = [UIColor whiteColor];
    manager.leftBtnborderColor = [UIColor whiteColor];
    manager.leftBtnBGColor = [UIColor whiteColor];
    manager.leftBtnTitleColor = [UIColor blackColor];
    manager.rightBtnTitleColor = [UIColor blackColor];
    
    [CGXPickerView showStringPickerWithTitle:@" " DataSource:self.array DefaultSelValue:self.array[3] IsAutoSelect:YES Manager:manager ResultBlock:^(id selectValue, id selectRow) {
//          NSLog(@"%@  %@",selectValue , selectRow);
        self.adviceType.text = selectValue;
    }];
}
@end
