//
//  SetThemeViewController.h
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 12..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetThemeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *themeImage;

@property (strong, nonatomic) UIScrollView *scrollview;
@property (strong, nonatomic) UIImageView *barImage;
@property (strong, nonatomic) NSMutableArray *items;


- (void)imageTaped:(UIGestureRecognizer *)gestureRecognizer ;

@end

