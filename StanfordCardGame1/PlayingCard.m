//
//  PlayingCard.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/5.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// override match method.
- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {  // TODO: hardcode style here.
        PlayingCard *othercard = [otherCards firstObject];
        
        if (othercard.rank == self.rank) {
            score = 4;
        } else if ([othercard.suit isEqualToString:self.suit])
            score = 1;
    }
    return score;
}

// inherit from class of Card.
- (NSString *) contents {
    NSArray *rankString = [PlayingCard rankString];  // TODO: self vs. PlayingCard?
    
    return [rankString[self.rank] stringByAppendingString:self.suit];
    // return rank with suit. (J♠, Q♣, K♦, A♥)
}

+ (NSArray *) validSuit {
    return @[@"♠", @"♣", @"♦", @"♥"];
}

+ (NSArray *) rankString {
    return @[@"0", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[self rankString] count] - 1;
}

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

// if we set both setter and getter, we need to synthesize it with '_'.
@synthesize suit = _suit;
- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

// getter of suit.
- (NSString *) suit {
    // NSArray *suitString = @[@"♠", @"♣", @"♦", @"♥"];
    return _suit ? _suit : @"?";
}

@end
