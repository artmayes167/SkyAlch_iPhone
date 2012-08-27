//
//  IngredientsForPotion.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "IngredientsForPotion.h"

@implementation IngredientsForPotion
@synthesize potionsLabel;
@synthesize ingredientsTV;
@synthesize ingredientsArray, currentPotionString;

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    @autoreleasepool {
        NSString *ing = @"";
        for (NSString *string in ingredientsArray) {
            ing = [ing stringByAppendingFormat:@"%@\n", string];
        }
        [ingredientsTV setText:ing];
        [potionsLabel setText:currentPotionString];
        ing = nil;
    }
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
