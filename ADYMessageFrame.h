//
//  ADYMessageFrame.h
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//
#define ADYNameFont     [UIFont systemFontOfSize:14]
#define ADYTextFont     [UIFont systemFontOfSize:15]
#import <Foundation/Foundation.h>
@class ADYMessage;
@interface ADYMessageFrame : NSObject

/**
 *  头像Frame
 */
@property(nonatomic,assign,readonly)CGRect iconF;

/**
 *  时间Frame
 */
@property(nonatomic,assign,readonly)CGRect timeF;

/**
 *  正文Frame
 */
@property(nonatomic,assign,readonly)CGRect textF;

/**
 *  cell的高度
 */
@property(nonatomic,assign,readonly)CGFloat cellHeight;

/**
 *  数据模型
 */
@property(nonatomic,strong) ADYMessage *message;


@end
