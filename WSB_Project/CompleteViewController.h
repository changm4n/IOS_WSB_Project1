//
//  CompleteViewController.h
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *completeImage;
@property (strong, nonatomic) UIImage *compimage;

- (IBAction)save:(id)sender;
- (IBAction)share:(id)sender;
@end
