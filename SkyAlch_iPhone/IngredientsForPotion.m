//
//  IngredientsForPotion.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "IngredientsForPotion.h"

@interface IngredientsForPotion ()
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTV;
@end

@implementation IngredientsForPotion
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
    self.navigationItem.title = self.currentPotionString;
    [self.ingredientsTV setText:[self.ingredientsArray componentsJoinedByString:@"\n"]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setIngredientsTV:nil];
    [self setIngredientsArray:nil];
    [self setCurrentPotionString:nil];
}

- (void)dealloc
{
#ifdef DEBUG
	//NSLog(@"dealloc %@", self);
#endif
}
@end
