//
//  Card.h
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/4.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong) NSString *contents;
@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChosen) BOOL chosen;
// - (int) match:(Card *) card;
- (int) match:(NSArray *) otherCards;

@end
