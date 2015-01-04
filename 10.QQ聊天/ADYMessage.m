//
//  ADYMessage.m
//  10.QQ聊天
//
//  Created by YOU on 15/1/3.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "ADYMessage.h"

@implementation ADYMessage


+(instancetype)messageWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
};
-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
};

@end
