//
//  MyProfile.h
//  HelloNoun
//
//  Created by 孙晓冬 on 14-4-12.
//  Copyright (c) 2014年 孙晓冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyProfile : NSObject
{
    NSString *myName;
}

- (NSString*)myName;
- (void)setMyName:(NSString*) aName;


@end
