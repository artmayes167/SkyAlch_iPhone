//
//  IngredientsForPotion.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "IngredientsForPotion.h"

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
        NSString *ing = @"";
        for (NSString *string in self.ingredientsArray) {
            ing = [ing stringByAppendingFormat:@"%@\n", string];
        }
        [self.ingredientsTV setText:ing];
        [self.potionsLabel setText:self.currentPotionString];
        ing = nil;
    
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self setPotionsLabel:nil];
    [self setIngredientsTV:nil];
    [self setIngredientsArray:nil];
    [self setCurrentPotionString:nil];
    [super viewWillDisappear:YES];
}

- (void)viewDidUnload
{
    [self setPotionsLabel:nil];
    [self setIngredientsTV:nil];
    [self setIngredientsArray:nil];
    [self setCurrentPotionString:nil];
    [super viewDidUnload];
}

- (IBAction)back:(id)sender {
     [super dismissModalViewControllerAnimated:YES];
}
@end
