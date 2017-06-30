//
//  BaseData.h
//  Template
//
//  Created by App Partner on 5/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModelLib.h"

@interface BaseData : JSONModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
