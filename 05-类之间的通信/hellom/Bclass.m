//
//  Bclass.m
//  hellom
//
//  Created by captain on 2018/1/31.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "Bclass.h"

@implementation Bclass

// Block调用
-(void)testBlcok:(MyBlock)block str1:(NSString *)str1
{
    NSLog(@"我是被谁调用的：%@", str1);
    NSLog(@"我来自于B类");
    block(@"我是在B类中执行的block");
}



// A -> B, A向B发广播
// 广播的注册
-(void)testNotification
{
    /*
    //不带参数的广播：
    //参数一：谁在接受这个方法，参数二：响应方法，参数三：广播名称，参数四：广播带的参数
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction) name:@"testnotific.." object:nil];
    Aclass *A = [[Aclass alloc]init];
     */

    //带参数的广播：
    //参数一：谁在接受这个方法，参数二：响应方法(带参数)，参数三：广播名称，参数四：广播带的参数
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction:) name:@"testnotific.." object:nil];
    Aclass *A = [[Aclass alloc]init];
}

//广播的响应

-(void)testAction
{
    NSLog(@"我已经收到广播");
}


//带参数的广播响应：
-(void)testAction:(NSNotification *)notific
{
    NSNumber *num = notific.object;
    NSDictionary *dic = notific.userInfo;
    NSLog(@"收到广播:obj:%@--dict:%@", num, dic);
}
//广播的销毁
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"testnotific.." object:nil];
    NSLog(@"广播已经被销毁");
}
@end
