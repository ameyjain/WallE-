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
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

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
    [self.loginButton setTitleColor:UIColor.mainColor forState:UIControlStateNormal];
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

- (IBAction)didPressLoginButton:(id)sender
{
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [UIView  beginAnimations: @"showCountries" context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [self.navigationController pushViewController: loginVC animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

- (IBAction)closeSignUpProcess:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void) signupUser
{
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField == _usernameTextField)
    {
        [self.passwordTextField becomeFirstResponder];
    }
    
    else if (textField == _passwordTextField && [self isValidInput])
    {
        [self.signUpButton becomeFirstResponder];
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
    if (textField == self.usernameTextField)
    {
        [self isEmailValid];
    }
    else if (textField == self.passwordTextField)
    {
        [self isPasswordValid];
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
        [self didFindErrorInUserName:[error localizedDescription]];
        return NO;
    }
    else if (![self.usernameTextField isValidEmail])
    {
        NSError *error = [NSError emailInvalid];
        [self didFindErrorInUserName:[error localizedDescription]];
        return NO;
    }
    
    [self resetUserNameView];
    return YES;
    
}


@end
