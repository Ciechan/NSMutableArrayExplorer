//
//  BCAppDelegate.m
//  NSMutableArrayExplorer
//
//  Created by Bartosz Ciechanowski on 04.03.2014.
//  Copyright (c) 2014 Bartosz Ciechanowski. All rights reserved.
//

#import "BCAppDelegate.h"
#import "BCExploredMutableArray.h"

@implementation BCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        [array addObject:@(i)];
    }
    
    NSLog(@"%@", [array explored_description]);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
