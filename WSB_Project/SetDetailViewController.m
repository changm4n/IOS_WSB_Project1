//
//  SetDetailViewController.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "SetDetailViewController.h"
#import "CompleteViewController.h"
@interface SetDetailViewController ()

@end

@implementation SetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.title = @"세부설정";
  
  _themeLabel.text = _themeNum;
  
  
  UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
  singleTap.numberOfTapsRequired = 1;
  singleTap.numberOfTouchesRequired = 1;
  [_ImageView addGestureRecognizer:singleTap];
  [_ImageView setUserInteractionEnabled:YES];
  
  
  _nameField.delegate = self;
  
  
  UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"완료" style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
  self.navigationItem.rightBarButtonItem = right;
  
  
  
}
//
//-(UIImage*) makeImage {
//  
//  UIGraphicsBeginImageContext(self.view.bounds.size);
//  
//  [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//  
//  UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//  UIGraphicsEndImageContext();
//  
//  return viewImage;
//}

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
  UIImageWriteToSavedPhotosAlbum(image ,nil, nil, nil);
  [self.navigationController pushViewController:view animated:YES];
  
}

- (void)imageTaped:(UIGestureRecognizer *)gestureRecognizer {
  UIActionSheet *myAct = [[UIActionSheet alloc]initWithTitle:@"사진 추가"
                                                    delegate:self
                                           cancelButtonTitle:@"취소"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"Camera",@"Album", nil];
  [myAct showInView:[self view]];
  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{[textField resignFirstResponder];return YES;}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
  
  myPicker = [[UIImagePickerController alloc]init];
  myPicker.delegate = self;
  
  switch (buttonIndex) {
    case 0://camera
      myPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
      break;
      
    case 1://album
      myPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
      break;
      
    default:
      break;
  }
  [self presentViewController:myPicker animated:YES completion:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
