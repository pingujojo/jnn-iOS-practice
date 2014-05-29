//
//  Deck.h
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/5.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Card.h"

@interface Deck : NSObject

// Polymorphism between 1 and 2 arguments at the same method name.
- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;

@end
