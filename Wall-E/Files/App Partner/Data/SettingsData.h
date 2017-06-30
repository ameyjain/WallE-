//
//  SettingsData.h
//  Template
//
//  Created by App Partner on 5/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "BaseData.h"

@interface SettingsData : JSONModel
@property (nonatomic, assign) int settingId;
@property (nonatomic, assign) int userId;
@property (nonatomic, assign) int notificationIsEnabled;
@end
