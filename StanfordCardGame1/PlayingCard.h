//
//  PlayingCard.h
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/5.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "Card.h"

// nothing about "Deck" part.
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuit;
+ (NSUInteger) maxRank;

@end
