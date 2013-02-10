//
//  PlistLib.m
//
//
//  Created by Andrea Martino on 2/10/13.
//  Copyright (c) 2013 Andrea Martino. All rights reserved.
//

#import "NSArray+PlistToArray.h"

@implementation NSArray (PlistToArray)

+(NSArray*)initArrayFromPlist:(NSString*)fileName withExtension:(NSString*)extension andForAllContentWithKey:(NSString*)keyString {
    
    NSArray *returnedArray = [[NSArray alloc] init]; //alloc & init
    NSError *error; //store error
    
    NSFileManager *fileManager = [NSFileManager defaultManager]; 
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //scan for Document folder and return path
    
    NSString *plistName = [NSString stringWithFormat:@"%@.%@", fileName, extension];
    
    NSString *plistPathFinal = [[paths objectAtIndex:0] stringByAppendingPathComponent:plistName]; //plist initial location (resource file folder)
    NSString *plistPathStart = [[NSBundle mainBundle] pathForResource:fileName ofType:extension]; //plist final location
    
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPathFinal]; 
    
    if ([fileManager fileExistsAtPath:plistPathFinal]==NO) { //if file doesn't exist
        
        [fileManager copyItemAtPath:plistPathStart toPath:plistPathFinal error:&error]; //copy plist in document folder
         NSLog(@"Done");
        
    }
    
    
    returnedArray = [plistDictionary valueForKey:keyString]; 
    
    return returnedArray;
    
    
}

@end
