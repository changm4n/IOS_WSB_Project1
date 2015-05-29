//
//  SetThemeViewController.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 12..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "SetThemeViewController.h"
#import "SetDetailViewController.h"
#define height_of_statusbar 20

@interface SetThemeViewController ()

@end

@implementation SetThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  CGFloat nRed=253/255.0;
  CGFloat nGreen=248/255.0;
  CGFloat nBlue=225/255.0;
  UIColor *myColor=[UIColor colorWithRed:nRed green:nGreen blue:nBlue alpha:1];
  
  
  
  float h = 87.7;
  float w = 58.5;
  float wpad = 36.0;
  float hpad = 10;
  int n = 16;
  
  _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-height_of_statusbar - self.navigationController.navigationBar.bounds.size.height,self.view.frame.size.width, h+2*hpad)];
  _scrollview.contentSize = CGSizeMake((w + wpad)*n+wpad , h);
  _scrollview.backgroundColor = myColor;
  _scrollview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  _scrollview.showsHorizontalScrollIndicator = NO;
  
  
  _barImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, _scrollview.frame.origin.y-20,self.view.frame.size.width,20)];
  [_barImage setImage:[UIImage imageNamed:@"bar.png"]];
  
  
  
  
  
  [self.view addSubview:_barImage];
  [self.view addSubview:_scrollview];
  
  for(int i = 0; i < n ; i++){
    UIImageView *Imageview = [[UIImageView alloc]initWithFrame:CGRectMake(wpad*(i+1)+(i*w),hpad,w,h)];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    
    
    
    [Imageview addGestureRecognizer:singleTap];
    [Imageview setUserInteractionEnabled:YES];
    Imageview.tag = i+1;
    [Imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"T%d",i+1]]];
    
    [_scrollview addSubview:Imageview];
    
   
  }
  
  
  UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nextButton.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
  self.navigationItem.rightBarButtonItem = right;
  
  
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     _scrollview.frame =CGRectMake(0, self.view.bounds.size.height - h-2*hpad-height_of_statusbar - self.navigationController.navigationBar.bounds.size.height,self.view.frame.size.width, h+2*hpad);
                     _barImage.frame = CGRectMake(0, _scrollview.frame.origin.y-20, 320, 20 );
                     
                   } completion:nil];
  

  
}

-(void)nextButtonPressed{
  
  SetDetailViewController *view = [[SetDetailViewController alloc]init];
  view.themeImage = _themeImage.image;
  [self.navigationController pushViewController:view animated:YES];
  
}



- (void)imageTaped:(UIGestureRecognizer*)sender {
  UIImageView *imageView = (UIImageView *)sender.view ;
  
  [_themeImage  setImage:[UIImage imageNamed:[NSString stringWithFormat:@"T%d",(int)imageView.tag]]];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
