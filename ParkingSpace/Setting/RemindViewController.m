//
//  RemindViewController.m
//  ParkingSpace
//
//  Created by 小细菌 on 2018/7/21.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

#import "RemindViewController.h"
#import "CGXPickerView.h"
@interface RemindViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textTime;

@property (weak, nonatomic) IBOutlet UILabel *nMessage;
@property (weak, nonatomic) IBOutlet UILabel *voice;
@property (weak, nonatomic) IBOutlet UILabel *vibariry;
@property (weak, nonatomic) IBOutlet UILabel *acceptAlert;
@property (weak, nonatomic) IBOutlet UILabel *remindTime;
@property (weak, nonatomic) IBOutlet UILabel *voice2;
@property (weak, nonatomic) IBOutlet UILabel *vibariry2;

@property (strong , nonatomic) NSArray* array;
@end

@implementation RemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = CustomStr(@"提醒设置");
    self.textTime.text = self.array[0];
    self.nMessage.text = CustomStr(@"新消息通知");
    self.voice.text = CustomStr(@"声音");
    self.vibariry.text = CustomStr(@"震动");
    self.acceptAlert.text = CustomStr(@"接受闹钟提醒");
    self.remindTime.text = CustomStr(@"提醒时间");
    self.voice2.text = CustomStr(@"声音");
    self.vibariry2.text = CustomStr(@"震动");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)array{
    if (!_array) {
        _array = @[CustomStr(@"最后20分钟") ,CustomStr(@"最后15分钟") ,CustomStr(@"最后10分钟") ,CustomStr(@"最后5分钟") ];
    }
    return _array;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [self.tableView reloadData];

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
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CustomStr(@"新消息提醒");
    }else{
        return CustomStr(@"闹钟提醒");
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)showRemindTimeChoose{
    [CGXPickerView showStringPickerWithTitle:@" " DataSource:self.array DefaultSelValue:self.array[0] IsAutoSelect:YES Manager:nil ResultBlock:^(id selectValue, id selectRow) {
        //          NSLog(@"%@  %@",selectValue , selectRow);
        self.textTime.text = selectValue;
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        [self showRemindTimeChoose];
    }
}

@end
