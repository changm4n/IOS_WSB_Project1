//
//  CompleteViewController.m
//  WSB_Project
//
//  Created by 이창민 on 2015. 5. 13..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "CompleteViewController.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>
@interface CompleteViewController () <UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *documentController;

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  [_completeImage setImage:_compimage];
  
  UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"backButton.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(backbuttonPressed)];
  UIBarButtonItem *right =[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"mainbutton.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(homeButtonPressed)];
  
  
  
  self.navigationItem.leftBarButtonItem = left;
  self.navigationItem.rightBarButtonItem = right;
  
}

-(void)backbuttonPressed{
  [self.navigationController popViewControllerAnimated:YES];
}
-(void)homeButtonPressed{
  [self.navigationController popToRootViewControllerAnimated:YES];
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

- (IBAction)save:(id)sender {
  NSData* imdata = UIImagePNGRepresentation ( _compimage );
  UIImage* im2 = [UIImage imageWithData:imdata];
  UIImageWriteToSavedPhotosAlbum(im2, nil, nil, nil);
  // UIImageWriteToSavedPhotosAlbum(_compimage, nil, nil, nil);
  
}

- (IBAction)share:(id)sender {
  
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString* path = [documentsDirectory stringByAppendingPathComponent:
                    @"test.png" ];
  NSData* data = UIImagePNGRepresentation(_compimage);
  [data writeToFile:path atomically:YES];
  
  NSLog(@"%@",path);
  [self sendFile:[[NSURL alloc] initFileURLWithPath:path]];
  

}

- (void)sendFile:(NSURL *)localPath {
  if (localPath) {
    self.documentController = [UIDocumentInteractionController interactionControllerWithURL:localPath];
    self.documentController.delegate = self;
    if ([self.documentController presentOptionsMenuFromRect:self.view.frame
                                                     inView:self.view
                                                   animated:YES]) {
      NSLog(@"Succeed to sending file.");
    } else {
      NSLog(@"There is no app for this file.");
    }
  }
}


- (void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController *)controller {
  NSLog(@"documentInteractionControllerWillPresentOptionsMenu");
  NSAssert(self.documentController == controller, @"self.documentController != controller");
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller {
  NSLog(@"documentInteractionControllerDidDismissOptionsMenu");
  NSAssert(self.documentController == controller, @"self.documentController != controller");
  self.documentController = nil;
}




@end
