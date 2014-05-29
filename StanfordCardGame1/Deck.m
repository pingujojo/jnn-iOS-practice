//
//  Deck.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/5.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
// some properties do not want to be public, but it is called in this implementation.
// So we put them at this block.
@property (strong, nonatomic) NSMutableArray *cards;    // of cards.
// NSMutableArray should be created when it was been declarifaction.
@end

@implementation Deck

- (NSMutableArray *) cards {

    // if _cards points to nil, then allocates itself.
    // it also called lazy instantiation.
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];   // TODO: How about use addObject:(id) here?
    } else {
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card *)card {
    [self addCard:card atTop:NO];   // implement "atTop" in terms of other method. (The same function name.) and call it at this method.
}

- (Card *) drawRandomCard {
    Card *randomCard = nil; // to get a random card.
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count]; // to get an index in one of the deck.
        randomCard = self.cards[index];
        // use "objectAtIndexedSubscript" to get the same object.
    
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
