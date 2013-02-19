//
//  PotionsAndIngredients.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PotionsAndIngredients;

@protocol PotionsAndIngredientsDelegate <NSObject>

- (void)potionsAndIngredientsControllerShouldBeDismissed:(PotionsAndIngredients *)controller;

@end

@interface PotionsAndIngredients : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *currentIngredientString;
@property (strong, nonatomic) NSArray *potionsArray;
@property (nonatomic, weak) id<PotionsAndIngredientsDelegate> delegate;

@end
