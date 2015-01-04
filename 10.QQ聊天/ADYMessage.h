//
//  ADYMessage.h
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    ADYMessagetypeMe=0,
    ADYMessagetypeOther
} ADYMessagetype;

@interface ADYMessage : NSObject
@property(nonatomic,copy)NSString *text;

@property(nonatomic,copy)NSString *time;

@property(nonatomic,assign)ADYMessagetype type;


+(instancetype)messageWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
