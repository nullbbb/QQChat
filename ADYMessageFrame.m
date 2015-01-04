
//
//  ADYMessageFrame.m
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "ADYMessageFrame.h"
#import "ADYMessage.h"
@implementation ADYMessageFrame

/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{

    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(void)setMessage:(ADYMessage *)message{
    _message=message;
    CGFloat padding=10;
    //屏幕宽度
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
     //1.时间
    
    if(message.showTime==YES){
        CGFloat timeX=0;
        CGFloat timeY=0;
        CGFloat timeW=screenW;
        CGFloat timeH=40;
        _timeF=CGRectMake(timeX, timeY, timeW, timeH);

    }
    
    //2.头像
   
    CGFloat iconY=CGRectGetMaxY(_timeF)+padding;
    CGFloat iconW=40;
    CGFloat iconH=40;
    CGFloat iconX;
    if (message.type==ADYMessagetypeOther) {
        iconX=padding;
    }else {
        iconX=screenW-padding-iconW;
    }
    _iconF=CGRectMake(iconX, iconY, iconW, iconH);
    
    //3.z正文
    
    CGFloat textY=iconY;
CGSize textSize=    [self sizeWithText:message.text font:ADYTextFont maxSize:CGSizeMake(180, MAXFLOAT)];
    CGFloat textX;
    if (message.type==ADYMessagetypeOther) {
        textX=CGRectGetMaxX(_iconF)+padding;
    }else {
        textX=iconX -padding-textSize.width;
    }
    _textF=CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //4. cell 的高度
    
    CGFloat textMaxY=CGRectGetMaxY(_textF);
    CGFloat iconMaxY=CGRectGetMaxY(_iconF);
  _cellHeight=MAX(textMaxY, iconMaxY)+padding;
                      
}



@end
