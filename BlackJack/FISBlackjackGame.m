//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Betty Fung on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@implementation FISBlackjackGame

-(instancetype) init{
    
    self = [super init];
    
    if (self){
        
        _deck = [[FISCardDeck alloc] init];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        
    }
    
    return self;
}

-(void)playBlackjack{
    
}



-(void)dealNewRound{
    
    [self.player resetForNewGame];
    [self.house resetForNewGame]; 
    
    for(NSUInteger i = 0; i < 2; i++){
        [self dealCardToPlayer];
        [self dealCardToHouse]; 
    }
    
}



-(void)dealCardToPlayer{
    
    [self.player acceptCard:[self.deck drawNextCard]];
    
}



-(void)dealCardToHouse{
    
    [self.house acceptCard:[self.deck drawNextCard]];
    
}



-(void)processPlayerTurn{
    
    if([self.player shouldHit] && !self.player.busted && !self.player.stayed){
        [self dealCardToPlayer];
    }
    
}



-(void)processHouseTurn{
    
    if([self.house shouldHit] && !self.house.busted && !self.house.stayed){
        [self dealCardToHouse];
    }
    
}



-(BOOL)houseWins{
    
    if(self.house.busted || (self.house.blackjack && self.player.blackjack)){
        return NO;
    }
    else if(self.player.busted || self.house.blackjack || self.house.handscore >= self.player.handscore){
        return YES;
    }
    
    return NO;
}



-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins{
    
    if(houseWins){
        self.house.wins++;
        self.player.losses++;
    }
    else{
        self.player.wins++;
        self.house.losses++;
    }
    
    NSLog(@"%@", [NSString stringWithFormat:@"house wins: %lu \nhouse losses: %lu \nplayer wins: %lu \nplayer losses: %lu", self.house.wins, self.house.losses, self.player.wins, self.player.losses]);
    
}

@end
