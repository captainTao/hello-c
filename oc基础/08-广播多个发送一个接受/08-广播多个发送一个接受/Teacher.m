//
//  Teacher.m
//  08-广播多个发送一个接受
//
//  Created by captain on 2018/2/9.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

-(id)init
{
    if(self = [super init])
    {
        NSDictionary *dics = @{@"name" : @"jake", @"address" : @"Bejing"};
//        NSObject *objs = [NSNumber numberWithInt:100];
        NSString *objs = @"teacher发送";

        [[NSNotificationCenter defaultCenter]postNotificationName:@"testNotification content!" object:objs userInfo:dics];
    }
    return self;
}

@end
