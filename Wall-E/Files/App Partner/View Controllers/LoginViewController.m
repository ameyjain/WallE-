//
//  LoginViewController.m
//  Template
//
//  Created by App Partner on 5/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "LoginViewController.h"
#import "SignupViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic, nullable) NoArgsCompletionBlock successCompletion;
@end

@implementation LoginViewController

#pragma mark - Lifecycle

- (nonnull instancetype)initWithSuccessCompletion:(NoArgsCompletionBlock _Nullable )completion
{
    self = [super init];
        
    if (self)
    {
        self.successCompletion = completion;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureNavBar];
    [self configureUI];
}


#pragma mark - UI

- (void)configureUI
{
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

- (void)configureNavBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didPressCancelButton)];
}


#pragma mark - Validation and Completion

- (BOOL)isValidInput
{
    // Username check
    if ([self.usernameTextField.text isEqualToString:@""])
    {
        [self displayErrorAlert:[NSError withMessage:@"Username cannot be empty"]];
        return NO;
    }
    else if (self.usernameTextField.text.length < 3)
    {
        [self displayErrorAlert:[NSError withMessage:@"Please enter a username that is at least 3 characters long"]];
        return NO;
    }
    
    // Password check
    if ([self.passwordTextField.text isEqualToString:@""])
    {
        [self displayErrorAlert:[NSError withMessage:@"Password cannot be empty"]];
        return NO;
    }
    else if (self.passwordTextField.text.length < 6)
    {
        [self displayErrorAlert:[NSError withMessage:@"Please enter a password that is at least 6 characters long"]];
        return NO;
    }

    return YES;
}


#pragma mark - Login

- (void)loginUser
{
    NSString *email = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [[UserManager shared] loginWithEmail:email password:password completion:^(BOOL succeeded, NSError *error)
    {
        if (succeeded)
        {
            [self dismissViewControllerAnimated:NO completion:nil];
            
            if (self.successCompletion)
            {
                self.successCompletion();
            }
        }
        else
        {
            [self displayErrorAlert:error title:@"Login Unsuccessful"];
        }
        
    }];
}

#pragma mark - Buttons

- (IBAction)didPressSignupButton:(id)sender
{
    
}

- (IBAction)didPressLoginButton:(id)sender
{
    if ([self isValidInput])
    {
        [self loginUser];
    }
}

- (IBAction)didPressAutofill:(id)sender
{
    self.usernameTextField.text = @"test@gmail.com";
    self.passwordTextField.text = @"testing";
}

- (void)didPressCancelButton
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.usernameTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    else
    {
        if ([self isValidInput])
        {
            [self loginUser];
            [self.view endEditing:YES];
            return YES;
        }
    }
    return NO;
}

@end
