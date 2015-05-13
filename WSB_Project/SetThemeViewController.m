//
//  SetThemeViewController.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 12..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "SetThemeViewController.h"
#import "SetDetailViewController.h"
@interface SetThemeViewController ()

@end

@implementation SetThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"테마설정";
  
  float h = 50.0;
  float w = 50.0;
  float pad = 10.0;
  int n = 10;
  
  _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - h-2*pad,self.view.frame.size.width, h+2*pad)];
  
  _scrollview.contentSize = CGSizeMake((w + pad)*n , h);
  _scrollview.backgroundColor = [UIColor darkGrayColor];
  _scrollview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  _scrollview.showsHorizontalScrollIndicator = NO;
  
  for(int i = 0; i < n ; i++){
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(pad*(i+1)+(i*w),pad,w,h)];
    [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal ];
    button.backgroundColor  = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollview addSubview:button];
   
  }
  
  
  
  
  UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"다음" style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
  self.navigationItem.rightBarButtonItem = right;
  
  
  
  
  [self.view addSubview:_scrollview];
  
}

-(void)nextButtonPressed{
  
  SetDetailViewController *view = [[SetDetailViewController alloc]init];
  view.themeNum =_themeSample.text;
  [self.navigationController pushViewController:view animated:YES];
  
}




-(void)buttonPressed:(id)sender{
  
  UIButton *tmp = (UIButton *)sender;

  
  _themeSample.text =  tmp.titleLabel.text;
  
  
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
