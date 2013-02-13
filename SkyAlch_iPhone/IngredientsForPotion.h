//
//  IngredientsForPotion.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IngredientsForPotion;

@protocol IngredientsForPotionDelegate <NSObject>

- (void)ingredientsForPotionShouldBeDismissed:(IngredientsForPotion *)controller;

@end

@interface IngredientsForPotion : UIViewController

@property (strong, nonatomic) NSString *currentPotionString;
@property (strong, nonatomic) NSArray *ingredientsArray;

@property (nonatomic, weak) id<IngredientsForPotionDelegate> delegate;

- (IBAction)back:(id)sender;

@end
