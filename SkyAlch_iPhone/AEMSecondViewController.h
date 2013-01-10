//
//  AEMSecondViewController.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IngredientsForPotion.h"
#import "MainDictionary.h"

@interface AEMSecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
