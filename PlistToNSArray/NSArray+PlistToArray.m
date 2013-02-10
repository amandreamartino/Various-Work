//
//  PlistLib.m
//  Shake to Bestemmia
//
//  Created by Andrea Martino on 2/10/13.
//  Copyright (c) 2013 Andrea Martino. All rights reserved.
//

#import "NSArray+PlistToArray.h"

@implementation NSArray (PlistToArray)

+(NSArray*)initArrayFromPlist:(NSString*)fileName withExtension:(NSString*)extension andForAllContentWithKey:(NSString*)keyString {
    
    NSArray *returnedArray = [[NSArray alloc] init];
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *plistName = [NSString stringWithFormat:@"%@.%@", fileName, extension];
    
    NSString *plistPathFinal = [[paths objectAtIndex:0] stringByAppendingPathComponent:plistName];
    NSString *plistPathStart = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
    
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPathFinal];
    
    if ([fileManager fileExistsAtPath:plistPathFinal]==NO) {
        
        [fileManager copyItemAtPath:plistPathStart toPath:plistPathFinal error:&error];
         NSLog(@"Done");
        
    }
    
    
    returnedArray = [plistDictionary valueForKey:keyString];
    
    return returnedArray;
    
    
}

@end
