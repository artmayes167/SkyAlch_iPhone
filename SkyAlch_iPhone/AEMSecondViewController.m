//
//  AEMSecondViewController.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMSecondViewController.h"

@implementation AEMSecondViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return  [[MainDictionary sharedDictionary]getPotionsCount];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @autoreleasepool {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [[cell textLabel] setText:[[MainDictionary sharedDictionary] getPotion: indexPath.row]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    @autoreleasepool {
        IngredientsForPotion *newView = [[IngredientsForPotion alloc] init];
        newView.ingredientsArray = [[MainDictionary sharedDictionary] getIngredientsForPotion:[[MainDictionary sharedDictionary] getPotion: indexPath.row]];
        newView.currentPotionString = [[MainDictionary sharedDictionary] getPotion: indexPath.row];
        [self presentModalViewController:newView animated:YES];
        newView = nil;
    }
}

@end
