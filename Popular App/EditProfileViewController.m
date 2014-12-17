//
//  EditProfileViewController.m
//  Popular App
//
//  Created by Andrew Liu on 11/17/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "EditProfileViewController.h"
#import "Profile.h"
#import "User.h"

@interface EditProfileViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation EditProfileViewController

//MARK: life cycle of view
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reloadProfile];
}

//MARK: load user's name, memo, username, and password count from parse
- (void)reloadProfile
{
    self.nameTextField.text = self.profile.name;
    self.descriptionTextField.text = self.profile.memo;
    UIImage *image = [UIImage imageWithData:self.profile.avatarData];
    self.imageView.image = image;
    self.emailTextField.text = self.user.email;
    self.passwordTextField.text = self.user.password;
}

//MARK: dismiss keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return YES;
}

//MARK: triger UIImagePicker(PhotoLibrary) by button pressed
- (IBAction)pickerImageOnButtonPressed:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

//MARK: UIImagePicker delegate to store and SAVE profile.avatarData and display on imageview
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *pickerImage = info[UIImagePickerControllerEditedImage];
    NSData *imageData = UIImageJPEGRepresentation(pickerImage, 0.1);
    self.profile.avatarData = imageData;
    [self.profile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error)
         {
             self.imageView.image = pickerImage;
         }
         else
         {
             [self error:error];
         }
     }];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//TODO: name is not updated
//MARK: confirm all the changes
- (IBAction)confirmEditingOnButtonPressed:(UIButton *)sender
{
    self.profile.name = self.nameTextField.text;
    self.profile.lowercaseName = [self.nameTextField.text lowercaseString];
    self.profile.memo = self.descriptionTextField.text;
    self.user.email = self.emailTextField.text;
    if (self.user.password.length != 0)
    {
        self.user.password = self.passwordTextField.text;
    }
    [self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error)
         {
             [self.profile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
              {
                  if (!error)
                  {
                      [self dismissViewControllerAnimated:YES completion:nil];
                  }
                  else
                  {
                      [self error:error];
                  }
              }];
         }
         else
         {
             [self error:error];
         }
     }];
}

//MARK: UIAlert
- (void)error:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
