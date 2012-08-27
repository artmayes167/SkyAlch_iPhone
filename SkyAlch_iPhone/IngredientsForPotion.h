//
//  IngredientsForPotion.h
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngredientsForPotion : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *potionsLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTV;
@property (strong) NSArray *ingredientsArray;
@property (strong) NSString *currentPotionString;

- (IBAction)back:(id)sender;

@end
