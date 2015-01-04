//
//  ADYMessageCell.m
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "ADYMessageCell.h"
#import "ADYMessageFrame.h"
#import "ADYMessage.h"
@interface ADYMessageCell ()
@property(nonatomic ,weak)UILabel *timeView;
@property(nonatomic ,weak)UIImageView   *iconView;
@property(nonatomic ,weak)UIButton  *textView;
@end

@implementation ADYMessageCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    //子控件的创建和初始化
        
        //1.时间
        UILabel *timeView=[[UILabel alloc]init];
        [self.contentView addSubview:timeView];
        timeView.textAlignment=NSTextAlignmentCenter;
        timeView.textColor=[UIColor lightGrayColor];
        timeView.font=[UIFont systemFontOfSize:13];
        self.timeView=timeView;
        //2.头像
        
        
        UIImageView *iconView=[[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        //3.征文
        
        
        UIButton *textView=[[UIButton alloc]init];
        textView.titleLabel.numberOfLines=0;
        textView.backgroundColor=[UIColor purpleColor];
        textView.titleLabel.font=ADYTextFont;
        [self.contentView addSubview:textView];
        self.textView=textView;
        
        //设置cell的背景色
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
     static NSString *ID=@"message";
    ADYMessageCell *cell=[tableview dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ADYMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)setMessageFrame:(ADYMessageFrame *)messageFrame{
    
    _messageFrame=messageFrame;
    
    ADYMessage *message=messageFrame.message;
    self.timeView.text=message.time;
    self.timeView.frame=messageFrame.timeF;
    
    
    self.iconView.image=[UIImage imageNamed:message.type==ADYMessagetypeMe?@"me":@"other"];
    self.iconView.frame=messageFrame.iconF;
    
    [self.textView setTitle:message.text forState:UIControlStateNormal];
    self.textView.frame=messageFrame.textF;
}
@end
