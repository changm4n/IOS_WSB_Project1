//
//  SetDetailViewController.h
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"
@interface SetDetailViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,CollectionViewControllerDelegate>{
    UIImagePickerController *myPicker;
}

@property (strong, nonatomic) IBOutlet UIImageView *plusImageView;

@property (strong, nonatomic) IBOutlet UIView *staticView;
@property (strong, nonatomic) IBOutlet UIImageView *themeBackImage;
@property (strong,nonatomic) UIImage *themeImage;

@property (strong, nonatomic) IBOutlet UITextField *dateText;
@property (strong, nonatomic) IBOutlet UITextField *serialText;
@property (strong, nonatomic) IBOutlet UITextField *exText;

@property (strong, nonatomic) UITextField *currentTextField;

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UITextField *nameField;


-(void)imagePicked:(UIImage *)image;

@end
