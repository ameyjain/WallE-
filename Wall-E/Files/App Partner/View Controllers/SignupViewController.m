//
//  SignupViewController.m
//  Template
//
//  Created by App Partner on 5/24/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "SignupViewController.h"
#import "JVFloatLabeledTextField.h"

@interface SignupViewController () <UITextFieldDelegate>

@property (strong, nonatomic, nullable) NoArgsCompletionBlock completion;

@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameErrorLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordErrorLabel;
@property (weak, nonatomic) IBOutlet UIView *passwordUnderLineView;
@property (weak, nonatomic) IBOutlet UIView *usernameUnderLineView;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *usernameTextField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *passwordTextField;

@end

@implementation SignupViewController

#pragma mark - Lifecycle

- (nonnull instancetype)initWithSuccessCompletion:(NoArgsCompletionBlock _Nullable )completion
{
    self = [super init];
    
    if (self)
    {
        self.completion = completion;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self configureNavBar];
}

#pragma mark - UI

- (void)configureFloatingLabels
{

    [_usernameTextField setFloatingLabelTextColor:UIColor.mainColor];
    [_usernameTextField setFloatingLabelActiveTextColor:UIColor.mainColor];
    [_passwordTextField setFloatingLabelTextColor: UIColor.mainColor];
    [_passwordTextField setFloatingLabelActiveTextColor:UIColor.mainColor];
}

- (void)configureUI
{
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    [self.usernameErrorLabel setHidden:true];
    [self.passwordErrorLabel setHidden:true];
    [self configureFloatingLabels];
    
}

-(void)didFindErrorInUserName:(NSString *) errorMessage
{
    [self.usernameErrorLabel setTextColor: [UIColor redColor]];
    [self.usernameErrorLabel setText: errorMessage];
    [self.usernameErrorLabel setHidden:NO];
    [self.usernameUnderLineView setBackgroundColor: [UIColor redColor]];

}

-(void)didFindErrorInPassport:(NSString *) errorMessage
{
    [self.passwordErrorLabel setTextColor: [UIColor redColor]];
    [self.passwordErrorLabel setText: errorMessage];
    [self.passwordErrorLabel setHidden:NO];
    [self.passwordUnderLineView setBackgroundColor: [UIColor redColor]];
}

-(void)resetUserNameView
{
    [self.usernameErrorLabel setHidden:YES];
    [self.usernameUnderLineView setBackgroundColor: [UIColor blackColor]];
}

-(void)resetPassportView
{
    [self.passwordErrorLabel setHidden:YES];
    [self.passwordUnderLineView setBackgroundColor: [UIColor blackColor]];
}

- (void)configureNavBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Buttons

- (IBAction)didPressSignupButton:(id)sender
{
    if ([self isValidInput])
    {
        [self signupUser];
    }
}

- (IBAction)toggleTextFieldSecureEntry:(id)sender
{
    BOOL isFirstResponder = self.passwordTextField.isFirstResponder;
    if (isFirstResponder)
    {
        [self.passwordTextField resignFirstResponder];
    }
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
    if (isFirstResponder)
    {
        [self.passwordTextField becomeFirstResponder];
    }
}

-(void) signupUser
{
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.signUpButton becomeFirstResponder];
    
    if ([self isValidInput])
    {
        [self signupUser];
        [self.view endEditing:YES];
        return YES;
    }

    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.passwordTextField)
    {
        [self resetPassportView];
    }
    else
    {
        [self resetUserNameView];
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if ([self isValidInput])
    {
        [self signUpButton];
    }

}

#pragma mark - Validation and Completion

- (BOOL)isValidInput
{
    if ([self isPasswordValid] && [self isEmailValid])
    {
        return YES;
    }

    return NO;
}

-(BOOL) isPasswordValid
{
    if (self.passwordTextField.text.length == 0)
    {
        NSError *error = [NSError passwordEmpty];
        [self didFindErrorInPassport:[error localizedDescription]];
        return NO;
    }
    else if (self.passwordTextField.text.length < 8 || self.passwordTextField.text.length > 20)
    {
        NSError *error = [NSError passwordTooShort];
        [self didFindErrorInPassport:[error localizedDescription]];
        return NO;
    }
    
    [self resetPassportView];
    return YES;
    
}

-(BOOL) isEmailValid
{
    if ([self.usernameTextField isEmpty])
    {
        NSError *error = [NSError emailEmpty];
        [self didFindErrorInPassport:[error localizedDescription]];
        return NO;
    }
    else if (![self.usernameTextField isValidEmail])
    {
        NSError *error = [NSError emailInvalid];
        [self didFindErrorInPassport:[error localizedDescription]];
        return NO;
    }
    
    [self resetPassportView];
    return YES;
    
}


@end
