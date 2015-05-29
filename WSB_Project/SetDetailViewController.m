//
//  SetDetailViewController.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "SetDetailViewController.h"
#import "CompleteViewController.h"
#import "CollectionViewController.h"
@interface SetDetailViewController ()

@property UITextField* tappedTextField;

@end

@implementation SetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


  [_themeBackImage setImage:_themeImage];
  
  
  
  UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
  singleTap.numberOfTapsRequired = 1;
  singleTap.numberOfTouchesRequired = 1;
  [_ImageView addGestureRecognizer:singleTap];
  [_ImageView setUserInteractionEnabled:YES];
  
  UITapGestureRecognizer *singleTapAtView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(otherTapped)];
  singleTap.numberOfTapsRequired = 1;
  singleTap.numberOfTouchesRequired = 1;
  [_staticView addGestureRecognizer:singleTapAtView];
  [_staticView setUserInteractionEnabled:YES];
  
  
  _nameField.delegate = self;
  
  
  UIBarButtonItem *right =[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nextButton.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
  UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"backButton.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(backbuttonPressed)];

  
  
  self.navigationItem.leftBarButtonItem = left;
  self.navigationItem.rightBarButtonItem = right;
  
  
  
}


-(void)keyboardWillShow:(NSNotification*)sender{
  
  if(_currentTextField != _nameField){
  NSDictionary* info = sender.userInfo;
  CGRect keyboardRect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
  
  float keyboardHeight = keyboardRect.size.height;
  
  [UIView animateWithDuration:[info[UIKeyboardAnimationDurationUserInfoKey] floatValue] delay:0 options:0 animations:^{
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    
    CGRect originalFrame = window.frame;
    
    originalFrame.origin.y = -keyboardHeight;
    
    window.frame = originalFrame;
    
    
  } completion:^(BOOL finished) {}];
  }
  
}
-(void)keyboardWillHide:(NSNotification*)sender{
  
  NSDictionary* info = sender.userInfo;
  
  [UIView animateWithDuration:[info[UIKeyboardAnimationDurationUserInfoKey] floatValue] delay:0 options:0 animations:^{
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    
    CGRect originalFrame = window.frame;
    
    originalFrame.origin.y = 0;
    
    window.frame = originalFrame;
    
    
  } completion:^(BOOL finished) {}];
  
}
- (UIImage *)snapshot:(UIView *)view
{
  
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
  [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}


-(void)nextButtonPressed{
  
  CompleteViewController *view = [[CompleteViewController alloc]init];
  UIImage *image = [self snapshot:self.view];
  view.compimage = image;
  [self.navigationController pushViewController:view animated:YES];
  
}
-(void)backbuttonPressed{
  [self.navigationController popViewControllerAnimated:YES];
}
-(void)otherTapped{
  [_currentTextField resignFirstResponder];
}

- (void)imageTaped:(UIGestureRecognizer *)gestureRecognizer {
  
  
  [self.view endEditing:YES];
  UIActionSheet *myAct = [[UIActionSheet alloc]initWithTitle:@"사진 추가"
                                                    delegate:self
                                           cancelButtonTitle:@"취소"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"Emoticon",@"Album", nil];
  [myAct showInView:[self view]];
  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{[textField resignFirstResponder];return YES;}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
  _currentTextField = textField;

}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
  
  CollectionViewController *collection = [[CollectionViewController alloc]init];
  myPicker = [[UIImagePickerController alloc]init];
  myPicker.delegate = self;
  
  switch (buttonIndex) {
    case 0://emotio
      collection.delegate = self;
      [self.navigationController pushViewController:collection animated:YES];
      break;
      
    case 1://album
      myPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
      [self presentViewController:myPicker animated:YES completion:nil];
      break;
      
    default:
      break;
  }

}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
  
  UIImage *tmp = [info objectForKey:UIImagePickerControllerOriginalImage];

  _ImageView.clipsToBounds = YES;
  [_ImageView setImage:tmp];
  
  [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePicked:(UIImage *)image{
  [_ImageView setImage:image];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
