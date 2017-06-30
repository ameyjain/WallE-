//
//  UserData.h
//  Template
//
//  Created by App Partner on 5/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "BaseData.h"
#import "SettingsData.h"

@interface UserData : BaseData
@property (nonatomic, assign) int userId;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign) int isActive;
@property (nonatomic, assign) long long lastActiveEpoch;
@property (nonatomic, copy) NSString *userToken;
@property (nonatomic, copy) NSString<Optional> *profileImage;
@property (nonatomic, copy) SettingsData<Ignore> *settings;
@end
