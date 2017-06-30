//
//  CompletionBlocks.h
//  Template
//
//  Created by Vladyslav Gusakov on 5/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#ifndef CompletionBlocks_h
#define CompletionBlocks_h

@import UIKit;
@class UserData;

typedef void (^NoArgsCompletionBlock)(void);
typedef void (^SuccessCompletionBlock)(BOOL);
typedef void (^GenericCompletionBlock)(BOOL, NSError *);
typedef void (^DictionaryCompletionBlock)(NSDictionary *);
typedef void (^DictionaryGenericCompletionBlock)(BOOL, NSError *, NSDictionary *);
typedef void (^StringCompletionBlock)(NSString *);
typedef void (^StringGenericCompletionBlock)(BOOL, NSError *, NSString *);
typedef void (^ErrorCompletionBlock)(NSError *);
typedef void (^UserCompletionBlock)(UserData*);
typedef void (^ProgressCompletionBlock)(CGFloat);


#endif /* CompletionBlocks_h */
