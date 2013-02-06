//
//  PotionsAndIngredients.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainDictionary.h"

@interface PotionsAndIngredients : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTV;
@property (weak, nonatomic) IBOutlet UITableView *potionsTable;
@property (weak, nonatomic) IBOutlet UILabel *currentIngredient;
@property (strong, nonatomic) NSArray *potionsArray;
@property (strong, nonatomic) NSString *currentIngredientString;
- (IBAction)back:(id)sender;

@end
