//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"
#import "FISBlackjackGame.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    FISBlackjackPlayer *newPlayer = [[FISBlackjackPlayer alloc] initWithName:@"Betty"];
//    NSLog(@"description: %@", newPlayer.description);
//    
//    FISCardDeck *newDeck = [[FISCardDeck alloc] init];
//    [newPlayer acceptCard:[newDeck drawNextCard]];
//    
//    NSLog(@"after drawing a card: %@", newPlayer.description);
    
    FISBlackjackGame *game = [[FISBlackjackGame alloc] init];
    NSLog(@"//////// FIRST GAME //////// \n");
    [game playBlackjack];
    NSLog(@"//////// SECOND GAME //////// \n");
    [game playBlackjack];
    NSLog(@"//////// THIRD GAME //////// \n");
    [game playBlackjack];
    
    
    
    
    return YES;
}

@end
