//
//  ViewController.m
//  GuessNumberGame
//
//  Created by Mac on 15/11/25.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化正确答案
    answer = arc4random()%100;
    
    
    //标题控件 : UILabel
    UILabel *lb = [[UILabel alloc]init];
    //通过设置控件的中心点
    lb.center = CGPointMake(self.view.center.x, 64);
    //我们如果通过center来给一个控件的位置赋值  我们需要再给控件设置一下宽高 如果用bounds，前两个都写成0，因为bounds的x y 值是以自身为标准
    lb.bounds = CGRectMake(0, 0, 380, 50);
    lb.backgroundColor = [UIColor redColor];
    lb.text = @"Welcome To The Game Of GuessingNumber!";
    lb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lb];
    
    
    //输入框
    tf = [UITextField new];
    tf.center = CGPointMake(self.view.center.x, 200);
    tf.bounds = CGRectMake(0, 0, 200, 50);
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.placeholder = @"请输入0-99之间的数字！";
    tf.backgroundColor = [UIColor redColor];
    [self.view addSubview:tf];

    
    
    //按钮
    UIButton *button = [UIButton new];
    button.center = CGPointMake(self.view.center.x, 300);
    button.bounds = CGRectMake(0, 0, 100, 50);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    
    //提示标签
    tishiLabel = [[UILabel alloc]init];
    tishiLabel.center = CGPointMake(self.view.center.x, 450);
    tishiLabel.bounds = CGRectMake(0, 0, 300, 50);
    tishiLabel.text = @"提示：";
    tishiLabel.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tishiLabel];
}
/*
 需求：背景图片  
 按钮1：当点击按钮的时候，能实现背景图片的切换（三张图片循环切换）
 按钮2：能将背景图片消失 再点击就会出现
 按钮3:
 让按钮2和按钮1的位置互换
 
 
 
 */





- (void)buttonClick:(UIButton *) sender{
    //1.判断输入框是否有输入，没有输入就提示
    //判断2个字符串是否一样： 用isEqualToString：
    if ([tf.text isEqualToString:@""]) {
        tishiLabel.text = @"SB，没输入数字啊！";
        return;//无返回值的方法，return 代表跳出方法体，后边的代码不需要执行。
    }
    //2.如果有输入，获取输入的数字 及 后台的正确答案
    //将字符串转化成基本类型
    if ([tf.text intValue] > answer) {
        tishiLabel.text = @"猜大了！";
    }else if([tf.text intValue] < answer ){
        tishiLabel.text = @"猜小了！";
    }else if ([tf.text intValue] == answer){
        tishiLabel.text = @"恭喜，猜对了！";
    }
    
    
    //3.比较输入数值与正确答案的大小
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
