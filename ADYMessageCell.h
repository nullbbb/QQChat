//
//  ADYMessageCell.h
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADYMessageFrame;
@interface ADYMessageCell : UITableViewCell

@property(nonatomic,strong) ADYMessageFrame *messageFrame;

 
+(instancetype)cellWithTableView:(UITableView *)tableview;
@end
