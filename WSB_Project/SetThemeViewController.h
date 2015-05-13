//
//  SetThemeViewController.h
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 12..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetThemeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *themeSample;

@property (strong, nonatomic) UIScrollView *scrollview;
@property (strong, nonatomic) NSMutableArray *items;


-(void)buttonPressed:(id)sender;

@end

