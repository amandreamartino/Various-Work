//
//  PlistLib.h
// 
//
//  Created by Andrea Martino on 2/10/13.
//  Copyright (c) 2013 Andrea Martino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray ()


+(NSArray*)initArrayFromPlist:(NSString*)fileName withExtension:(NSString*)extension andForAllContentWithKey:(NSString*)keyString;



@end
