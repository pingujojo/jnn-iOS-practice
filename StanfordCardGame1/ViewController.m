//
//  ViewController.m
//  StanfordCardGame1
//
//  Created by Chung-Chan Wu on 2014/5/4.
//  Copyright (c) 2014年 Chung-Chan Wu. All rights reserved.
//

#import "CardMatchingGame.h"
#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
//@property (strong, nonatomic) Deck* deck;
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if (_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButton count]
                                                  usingDeck:[self createDeck]];
    }
    
    return _game;
}

/*- (Deck *) deck {
    //self = [super init];
    if (!_deck) {
        _deck = [self createDeck];
        NSLog(@"_deck = nil");
    }
    else {
        NSLog(@"_deck exist");
    }
    
    return _deck;
}*/

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void) setFlipCount:(int)flipCount {

    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"%d", self.flipCount];
}*/

- (IBAction)touchCardButton:(UIButton *)sender {

/*
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *randomCard = [self.deck drawRandomCard];
        
        if (!randomCard) {
            self.deck = [self createDeck];
            randomCard = [self.deck drawRandomCard];
            NSLog(@"create deck");
        }
        
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
    }
        self.flipCount++;
*/
    /*NSInteger choosenButtonIndex = [self.cardButton indexOfObject:sender];    // Button array.
    [self.game chooseCardAtIndex:choosenButtonIndex];
    [self updateUI];*/
}

- (void) updateUI
{
    for (UIButton *cardButto in self.cardButton) {
        NSUInteger cardButtonIdex = [self.cardButton indexOfObject:cardButto];
        Card *card = [self.game cardAtIndex:cardButtonIdex];
        
        [cardButto setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButto setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        cardButto.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"%ld", self.game.score];
    }
}

- (NSString *) titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) imageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
