//
//  BaseData.m
//  Template
//
//  Created by App Partner on 5/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "BaseData.h"

@implementation BaseData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary.allKeys.count) { return nil; }
    
    NSError *error;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    id instance = [super initWithString:jsonString error: &error];
    
    if (error)
    {
        NSLog(@"Error: %@", error);
    }
    
    return instance;
}

//Converts `user_id` from JSON to `userId` in code automatically
+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
