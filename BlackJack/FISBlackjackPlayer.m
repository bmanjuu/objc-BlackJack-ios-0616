//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Betty Fung on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype) init {
    
    self = [self initWithName:@""];
    
    return self;
}

-(instancetype) initWithName:(NSString *)name{
    
    self = [super init];
    
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        _handscore = 0;
        _wins = 0;
        _losses = 0;
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
    }
    
    return self;
}



-(void)resetForNewGame{
    
}


//-(void)calculateHandScore{
//    
//    for(FISCard *cardWorth in self.cardsInHand){
//        if([cardWorth.cardLabel containsString:@"A"]){
//            self.aceInHand = YES;
//            if(self.handscore <= 11){
//                self.handscore += 10;
//            }
//            else {
//                self.handscore += 1;
//            }
//        }
//        else {
//            self.handscore += cardWorth.cardValue;
//        }
//    }
//    
//    if ([self.cardsInHand count] == 2 && self.handscore == 21){
//        self.blackjack = YES;
//    }
//    else if (self.handscore > 21){
//        self.busted = YES;
//    }
//
//}

-(NSUInteger)detectAce{
    
    NSUInteger aceCount = 0;
    
    for (FISCard *card in self.cardsInHand){
        if([card.rank isEqualToString:@"A"]){
            self.aceInHand = YES;
            aceCount ++;
        }
    }
    
    return aceCount;
}


-(void)acceptCard:(FISCard *)card{
    
    [self.cardsInHand addObject:card];
    NSLog(@"\n\n\n\n\n\n\n\nthe card is: %@", card.cardLabel);
    
    NSUInteger score = card.cardValue;
    
    if([self detectAce] > 0){
        
        if (self.handscore <= 11 && [self detectAce] == 1)
        score = 11;
        else if (self.handscore > 11 || [self detectAce] > 1){
            score = 1;
        }
    }
    else {
        score = card.cardValue;
    }
    
    self.handscore += score;
    
    if(self.handscore > 21){
        self.busted = YES;
        return;
    }
    else if (self.handscore == 21){
        self.blackjack = YES;
        return;
    }
    
    NSLog(@"score is: %lu, total handscore: %lu", score, self.handscore);
}



-(BOOL)shouldHit{
    return NO; 
}

@end
