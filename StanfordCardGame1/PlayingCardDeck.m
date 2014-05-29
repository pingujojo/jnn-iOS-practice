//
//  PlayingCardDeck.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/6.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init {

    self = [super init];
    
    if (self) {
        // initial for card deck;
        for (NSString *suit in [PlayingCard validSuit]) {
            for (NSInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
