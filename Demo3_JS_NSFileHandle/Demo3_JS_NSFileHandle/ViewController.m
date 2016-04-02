//
//  ViewController.m
//  Demo3_JS_NSFileHandle
//
//  Created by  江苏 on 16/3/10.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)NSFileHandle* fileHadle;
@property(strong,nonatomic)UIImageView* iamgeView;
@property(strong,nonatomic)NSMutableData* data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data=[NSMutableData data];
//    NSFileHandle* filrHandle=[NSFileHandle fileHandleForReadingAtPath:@"/Users/jiangsu/Downloads/IMG_2388.JPG"];
    //得到文件的长度
//    long long length=[filrHandle seekToEndOfFile];
    //将标记移到文件开头
//    [filrHandle seekToFileOffset:0];
    //将文件的一半读取出来并且存入data
//    NSData* data=[filrHandle readDataOfLength:length/2];
    //将data转变成图片
//    UIImage* imagex=[UIImage imageWithData:data];
//    UIImageView* imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageView.image=imagex;
//    [self.view addSubview:imageView];
    self.iamgeView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.iamgeView];
    self.fileHadle=[NSFileHandle fileHandleForReadingAtPath:@"/Users/jiangsu/Downloads/IMG_2388.JPG"];
    [NSTimer scheduledTimerWithTimeInterval:1.0/100 target:self selector:@selector(loadingImage:) userInfo:nil repeats:YES];
}
-(void)loadingImage:(NSTimer*)timer{
    NSData* subData=[self.fileHadle readDataOfLength:1200];
    if (subData.length==0) {
        [timer invalidate];
    }
    [self.data appendData:subData];
    UIImage* iamgex=[UIImage imageWithData:self.data];
    self.iamgeView.image=iamgex;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
