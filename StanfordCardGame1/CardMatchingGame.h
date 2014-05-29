//
//  CardMatchingGame.h
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/25.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck;    // create a certain given deck.

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;    // read-only property, show score only.

@end
