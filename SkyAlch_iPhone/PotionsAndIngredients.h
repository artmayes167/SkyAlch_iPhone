//
//  PotionsAndIngredients.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PotionsAndIngredients;

@interface PotionsAndIngredients : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *currentIngredientString;
@property (strong, nonatomic) NSArray *potionsArray;

@end
