//
//  IngredientsForPotion.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "IngredientsForPotion.h"

@interface IngredientsForPotion ()
@property (weak, nonatomic) IBOutlet UILabel *potionsLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTV;
- (IBAction)back:(id)sender;
@end

@implementation IngredientsForPotion
@synthesize potionsLabel = _potionsLabel;
@synthesize ingredientsTV = _ingredientsTV;
@synthesize ingredientsArray = _ingredientsArray;
@synthesize currentPotionString = _currentPotionString;

#pragma mark - View lifecycle


-(void) setIngredientsArray:(NSArray *)ingredientsArray{
    if(!_ingredientsArray) _ingredientsArray = [NSArray new];
    _ingredientsArray = ingredientsArray;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.ingredientsTV setText:[self.ingredientsArray componentsJoinedByString:@"\n"]];
    [self.potionsLabel setText:self.currentPotionString];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self setPotionsLabel:nil];
    [self setIngredientsTV:nil];
    [self setIngredientsArray:nil];
    [self setCurrentPotionString:nil];
}

- (IBAction)back:(id)sender {
    [self.delegate ingredientsForPotionShouldBeDismissed:self];
}

- (void)dealloc
{
#ifdef DEBUG
	NSLog(@"dealloc %@", self);
#endif
}
@end
