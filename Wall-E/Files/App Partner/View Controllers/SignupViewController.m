//
//  SignupViewController.m
//  Template
//
//  Created by App Partner on 5/24/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic, nullable) NoArgsCompletionBlock successCompletion;
@end

@implementation SignupViewController

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
    [self configureUI];
}


#pragma mark - UI

- (void)configureUI
{
    self.usernameTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
}


#pragma mark - Validation and Completion

- (BOOL)isValidInput
{
    // Username check
    if (self.usernameTextField.text.length == 0)
    {
        [self displayErrorAlert:[NSError usernameEmpty]];
        return NO;
    }
    else if (self.usernameTextField.text.length < 3)
    {
        [self displayErrorAlert:[NSError usernameTooShort]];
        return NO;
    }
    
    // Email check
    if (self.emailTextField.text.length == 0)
    {
        [self displayErrorAlert:[NSError emailEmpty]];
        return NO;
    }
    
    // Password check
    if (self.passwordTextField.text.length == 0)
    {
        [self displayErrorAlert:[NSError passwordEmpty]];
        return NO;
    }
    else if (self.passwordTextField.text.length < 6)
    {
        [self displayErrorAlert:[NSError passwordTooShort]];
        return NO;
    }
    
    return YES;
}


#pragma mark - Login

- (void)signupUser
{
    [[UserManager shared] signupWithUsername:self.usernameTextField.text email:self.emailTextField.text password:self.passwordTextField.text completion:^(BOOL succeeded, NSError *error) {
        
        if (succeeded)
        {
            // Assuming this login flow was presented modally
            [self dismissViewControllerAnimated:YES completion:nil];
            
            if (self.successCompletion)
            {
                self.successCompletion();
            }
            
        }
        else
        {
            [self displayErrorAlert:error title:@"Signup Unsuccessful"];
        }
    }];
}


#pragma mark - Buttons

- (IBAction)didPressSignupButton:(id)sender
{
    if ([self isValidInput])
    {
        [self signupUser];
    }
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.usernameTextField)
    {
        [self.emailTextField becomeFirstResponder];
    }
    else if (textField == self.emailTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    else
    {
        if ([self isValidInput])
        {
            [self signupUser];
            [self.view endEditing:YES];
            return YES;
        }
    }
    return NO;
}

@end
