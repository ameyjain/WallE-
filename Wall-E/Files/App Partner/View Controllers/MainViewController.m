//
//  MainViewController.m
//  Template_iOS
//
//  Created by App Partner on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "MainViewController.h"
#import "MainModel.h"

@interface MainViewController () <CoreViewController>
@property (weak, nonatomic) IBOutlet UILabel *ipLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) MainModel *model;
@end

@implementation MainViewController

#pragma mark - Lifecycle

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.model = [MainModel new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // TODO: Remove test networking call when ready for development
    [self.model getIPText:^(NSString *text)
     {
         self.ipLabel.text = text;
     }];
}


#pragma mark - UI

- (void)configureUI
{
    [[UserManager shared] displayLoginScreenOnSuccess:^{
        //reload data
    }];
    
    // TODO: Remove test image loading when ready for development
    NSURL *url = [NSURL URLWithString:@"https://static2.clutch.co/sites/default/files/logos/app_partner_logo_stacked.png"];
    [self.imageView setImageWithUrl:url refreshCached:YES];
}


#pragma mark - CoreViewController

- (NSString*)title
{
    return @"App Partner";
}

@end
