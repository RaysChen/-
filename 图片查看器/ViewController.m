//
//  ViewController.m
//  图片查看器
//
//  Created by 陈曦 on 16/1/27.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
/*
 用纯代码开发的过程
 1.确定界面元素
 2.用代码搭建界面
 3.用代码实现功能
 
 */




@interface ViewController ()

@property(nonatomic,strong) UILabel *noLabel;
@property(nonatomic,strong) UIImageView *iconImage;
@property(nonatomic,strong) UILabel *descLable;
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;

@property(nonatomic,assign) int  index;//当前显示的图片索引

@end

@implementation ViewController

//在viewDidLoad中创建界面
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//1.序号noLabel
    self.noLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,20,self.view.bounds.size.width,40)];
    self.noLabel.text = @"1/5";
    self.noLabel.textAlignment = NSTextAlignmentCenter;
    
    [self . view addSubview:self.noLabel];
//2.图像iconImage
    CGFloat imageW = 200;
    CGFloat imageH = 200;
    CGFloat imageX = (self.view.bounds.size.width - imageW) *0.5;
    CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
    _iconImage = [ [UIImageView alloc] initWithFrame:CGRectMake(imageX,imageY,imageW,imageH)];
    //放素材
    _iconImage .image = [UIImage imageNamed:@"dahuangmao-1"];
    
    //_iconImage.backgroundColor =[UIColor redColor];
    
    [self.view addSubview:_iconImage];
    
//3.描述文字
    CGFloat descY = CGRectGetMaxY(self.iconImage.frame);
     _descLable =[[UILabel alloc]initWithFrame:CGRectMake(0, descY,self.view.bounds.size.width,
                                                          100)];
    _descLable .text = @"该吃饭了";
    _descLable.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:_descLable];
    
//4.左边按钮
    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    CGFloat centerY = self.iconImage.center.y;
    CGFloat centerx = self.iconImage.frame.origin.x*0.5 ;
    _leftButton.center = CGPointMake(centerx,centerY);
    
    [ _leftButton setBackgroundImage:[UIImage imageNamed:@"left226"] forState:UIControlStateNormal];
    [self.view addSubview:_leftButton];
    
    [_leftButton addTarget:self action:@selector(prePhoto) forControlEvents:
     UIControlEventTouchUpInside];//添加监听事件
    
    
//5.右边按钮
    _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    
    _rightButton.center = CGPointMake( self.view.bounds.size.width -centerx,centerY);
    
    [ _rightButton setBackgroundImage:[UIImage imageNamed:@"right+arrow5"] forState:UIControlStateNormal];
    [self.view addSubview:_rightButton];

    [ _rightButton  addTarget:self action:@selector(nextPhoto) forControlEvents:UIControlEventTouchUpInside];//添加监听事件，相当于连线
}



//点击查看上一张照片的方法
- (void)prePhoto
{
    NSLog(@"%s",__func__);//调试检查监听事件是否成功
    
    self.index--;
    
    //设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%d/%d",self.index+1,5];
    
    //设置图片和文字描述
    switch (self.index)
    {
        case 0:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-1"];
            self.descLable.text = @"该吃饭了";
            break;
            
        case 1:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-2"];
            self.descLable.text = @"我是一朵猫花";
            break;
            
        case 2:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-3"];
            self.descLable.text = @"洗澡洗澡啊";
            break;
        case 3:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-4"];
            self.descLable.text = @"上班啦";
            break;
        case 4:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-5"];
            self.descLable.text = @"发工资";
            break;
            
    }
    
    
    
    self.rightButton.enabled =(self.index !=4);
    self.leftButton.enabled =(self.index !=0);

}

//点击下一张照片的方法
- (void)nextPhoto
{
    NSLog(@"%s",__func__);//调试检查监听事件是否成功
    
    self.index++;
    
    //设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%d/%d",self.index+1,5];
    
    //设置图片和文字描述
    switch (self.index)
    {
        case 0:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-1"];
            self.descLable.text = @"该吃饭了";
            break;
            
        case 1:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-2"];
            self.descLable.text = @"我是一朵猫花";
            break;
            
        case 2:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-3"];
            self.descLable.text = @"洗澡洗澡啊";
            break;
        case 3:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-4"];
            self.descLable.text = @"上班啦";
            break;
        case 4:
            self.iconImage.image = [ UIImage imageNamed:@"dahuangmao-5"];
            self.descLable.text = @"发工资";
            break;
   
      }
    
    
    //控制按钮状态
//    if (self.index == 4) {
//      self.rightButton.enabled = NO;
//    }else{
//      self.rightButton.enabled = YES;
//    }
    
    self.rightButton.enabled =(self.index !=4);
    self.leftButton.enabled =(self.index !=0);
  }
@end
    
