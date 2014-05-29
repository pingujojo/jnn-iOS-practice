//
//  CardMatchingGame.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/25.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "CardMatchingGame.h"

// class extension.
@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score; // reset score's type to implement privately.
@property (nonatomic, strong) NSMutableArray *cards;   // of cards
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init]; // lazy instantiation
    
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];    // super's designated init.
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) { // to protect if card = nil.
                [self.cards addObject:card];
            } else {
                self.cards = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    // to protect it.
    if (index < [self.cards count]) {
        return [self.cards objectAtIndex:index];    // same as self.cards[index];
        //return self.cards[index];
    } else {
        return nil;
    }
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];  // card at a certain index;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *othercard in self.cards) {
                if (othercard.isChosen && !othercard.isMatched) {
                    int matchScore = [card match:@[othercard]]; // card match with othercard.
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        othercard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        othercard.chosen = NO;
                    }
                    
                    break;  // could choose 2 cards only.
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
