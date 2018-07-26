//
//
//  Created by mythkiven on 15/11/12.
//  Copyright © 2015年 3code. All rights reserved.
//

#import "JPullEmailTF.h"
#import "JPullTableViewCell.h"

#define cellH 44

@interface JPullEmailTF ()<UITableViewDataSource, UITableViewDelegate>

/** 邮箱下拉列表 */
@property (strong, nonatomic) UITableView *pullTableView;

/** 匹配输入的邮箱后缀数组(用来显示在列表中)dataSource*/
@property (strong, nonatomic) NSArray *matchedSuffixArray;


@end

@implementation JPullEmailTF

#pragma mark － 默认邮箱
- (void)setUpEmailSuffixArray {
    self.mailsuffixData = @[
                            @"gmail.com",
                            @"live.com",
                            @"qq.com",
                            @"sina.com",
                            @"126.com",
                            @"outlook.com",
                            @"foxmail.com",
                            @"hotmail.com",
                            @"tom.com",
                            @"icloud.com",
                            @"sohu.com",
                            @"msn.com",
                            @"138.com",
                            @"139.com"
                            ];
}

#pragma mark - UI创建
- (instancetype)initWithFrame:(CGRect)frame InView:(UIView *)view {
    if (self = [super initWithFrame:frame]) {
        return [self setUpInView:view];
    }
    return nil;
}

- (void)awakeFromNib {
    [self setUpInView:[self getCurrentVC].view];
}

- (instancetype)setUpInView:(UIView *)view {
    CGFloat textX = self.frame.origin.x;
    CGFloat textY = self.frame.origin.y;
    CGFloat textH = self.frame.size.height;
    CGFloat textW = self.frame.size.width;
    
    self.pullTableView = [[UITableView alloc] initWithFrame:CGRectMake(textX, textY+textH, textW, 4*cellH) style:UITableViewStylePlain];
    self.pullTableView.dataSource = self;
    self.pullTableView.delegate = self;
    [self setUpEmailSuffixArray];
    [self.pullTableView registerNib:[UINib nibWithNibName:@"JPullTableViewCell" bundle:nil]    forCellReuseIdentifier:@"JPullTableViewCell"];
    self.pullTableView.userInteractionEnabled = YES;
    self.pullTableView.hidden = YES;
    [view addSubview:self.pullTableView];
    
    [self addTarget:self action:@selector(textFieldDidChanged) forControlEvents:UIControlEventEditingChanged];
    self.keyboardType = UIKeyboardTypeASCIICapable;
    
    return self;
}
#pragma mark － textFieldDidChanged
- (void)textFieldDidChanged {
    if ([self.text containsString:@"@"]) {
        self.pullTableView.hidden = NO;
        NSString *latterStr = [self.text substringFromIndex:[self.text rangeOfString:@"@"].location+1];
        if ([latterStr isEqualToString:@""]) {
            self.matchedSuffixArray = self.mailsuffixData;
        } else {
            self.matchedSuffixArray = [self.mailsuffixData filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self beginswith %@", [self deleteSpacesInString:latterStr]]];
            if (self.matchedSuffixArray.count == 0) {
                self.pullTableView.hidden = YES;
            }
        }
        [self.pullTableView reloadData];
    } else {
        self.pullTableView.hidden = YES;
    }
}

#pragma mark 去掉空格
- (NSString *)deleteSpacesInString:(NSString *)string {
    if ([string containsString:@" "]) {
        return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    } else {
        return string;
    }
}



#pragma mark -
- (void)setMailCellHeight:(CGFloat)mailCellHeight{
    _mailCellHeight = mailCellHeight;
    [self.pullTableView reloadData];
}
-(void)setMailListHeight:(CGFloat)mailListHeight{
    _mailListHeight = mailListHeight;
    _pullTableView.frame = CGRectMake(_pullTableView.frame.origin.x,
                                      _pullTableView.frame.origin.y,
                                      _pullTableView.frame.size.width,
                                      _mailListHeight);
}
-(void)setMailListframe:(CGRect)mailListframe{
    _mailListframe = mailListframe;
    _pullTableView.frame = mailListframe;
}
-(void)setMailFont:(UIFont *)mailFont{
    _mailFont = mailFont;
    [self.pullTableView reloadData];
}
-(void)setMailFontColor:(UIColor *)MailFontColor{
    _MailFontColor=MailFontColor;
    [self.pullTableView reloadData];
}
-(void)setMailCellColor:(UIColor *)mailCellColor{
    _mailCellColor = mailCellColor;
    [self.pullTableView reloadData];
}
-(void)setMailBgColor:(UIColor *)mailBgColor{
    _mailBgColor = mailBgColor;
    self.pullTableView.backgroundColor =_mailBgColor;
}
- (void)setMLeftMargin:(CGFloat)margin {
    _mLeftMargin = margin;
    [self.pullTableView reloadData];
}
-(void)setMailsuffixData:(NSArray *)mailsuffixData{
    if (_mailsuffixData.count) {
        _mailsuffixData = nil;
    }
    _mailsuffixData = mailsuffixData;
    [self.pullTableView reloadData];
}
-(void)setSeparatorInsets:(NSArray *)separatorInsets{
    _separatorInsets = separatorInsets;
    [self.pullTableView reloadData];
}


- (void)hideEmailPrompt {
    self.pullTableView.hidden = YES;
}

#pragma mark - tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.matchedSuffixArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JPullTableViewCell *cell = [self.pullTableView dequeueReusableCellWithIdentifier:@"JPullTableViewCell" forIndexPath:indexPath];
    NSString *formerStr = [self.text substringToIndex:[self.text rangeOfString:@"@"].location+1];
    cell.emailLabel.text = [formerStr stringByAppendingString:self.matchedSuffixArray[indexPath.row]]        ;
    CGRect rect = cell.emailLabel.frame;
    
    if (self.mailFont) cell.emailLabel.font = self.mailFont;
    if (self.MailFontColor) cell.emailLabel.textColor = self.MailFontColor;
    if (self.mailCellColor) cell.backgroundColor = self.mailCellColor;
    if (self.mailCellHeight) {
        rect.size.height = self.mailCellHeight;
        cell.emailLabel.frame = rect;
    } else {
        rect.size.height = cellH;
        cell.emailLabel.frame = rect;
    }
    
    
    rect.origin.x = self.mLeftMargin;
    cell.emailLabel.frame = rect;
    cell.touchButton.tag = indexPath.row;
    [cell.touchButton addTarget:self action:@selector(tapCell:) forControlEvents:UIControlEventTouchUpInside];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 && self.separatorInsets) {
        cell.separatorInset = UIEdgeInsetsMake([self.separatorInsets[0] floatValue], [self.separatorInsets[1] floatValue], [self.separatorInsets[2] floatValue], [self.separatorInsets[3] floatValue]);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.mailCellHeight ? self.mailCellHeight : cellH;
}

- (void)tapCell:(UIButton *)sender {
    NSString *formerStr = [self.text substringToIndex:[self.text rangeOfString:@"@"].location+1];
    self.text = [formerStr stringByAppendingString:self.matchedSuffixArray[sender.tag]];
    self.pullTableView.hidden = YES;
}
- (UIViewController *)getCurrentVC
{
    // 定义一个变量存放当前屏幕显示的viewcontroller
    UIViewController *result = nil;
    
    // 得到当前应用程序的主要窗口
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    // windowLevel是在 Z轴 方向上的窗口位置，默认值为UIWindowLevelNormal
    if (window.windowLevel != UIWindowLevelNormal)
    {
        // 获取应用程序所有的窗口
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            // 找到程序的默认窗口（正在显示的窗口）
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                // 将关键窗口赋值为默认窗口
                window = tmpWin;
                break;
            }
        }
    }
    
    // 获取窗口的当前显示视图
    UIView *frontView = [[window subviews] objectAtIndex:0];
    
    // 获取视图的下一个响应者，UIView视图调用这个方法的返回值为UIViewController或它的父视图
    id nextResponder = [frontView nextResponder];
    
    // 判断显示视图的下一个响应者是否为一个UIViewController的类对象
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}

@end
