//
//  Card.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/4.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "Card.h"

@implementation Card

//- (int) match:(Card *)card {
- (int) match:(NSArray *)otherCards {
    int score = 0;
    Card *card;

    for (card in otherCards) {  // fast enumeration.
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }

    return score;
}

@end
