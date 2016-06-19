//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISBlackjackPlayer *newPlayer = [[FISBlackjackPlayer alloc] initWithName:@"Betty"];
    NSLog(@"description: %@", newPlayer.description);
    
    FISCardDeck *newDeck = [[FISCardDeck alloc] init];
    [newPlayer acceptCard:[newDeck drawNextCard]];
    
    NSLog(@"after drawing a card: %@", newPlayer.description);
    
    return YES;
}

@end
