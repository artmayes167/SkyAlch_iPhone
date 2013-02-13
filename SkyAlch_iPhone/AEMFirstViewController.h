//
//  AEMFirstViewController.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainDictionary.h"
#import "PotionsAndIngredients.h"

@interface AEMFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, PotionsAndIngredientsDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
