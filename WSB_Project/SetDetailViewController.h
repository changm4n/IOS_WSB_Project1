//
//  SetDetailViewController.h
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetDetailViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>{
    UIImagePickerController *myPicker;
}


@property (strong,nonatomic) NSString *themeNum;


@property (strong, nonatomic) IBOutlet UILabel *themeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UITextField *nameField;

@end
