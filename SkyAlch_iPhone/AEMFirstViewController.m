//
//  AEMFirstViewController.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMFirstViewController.h"

@implementation AEMFirstViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return  [[MainDictionary sharedDictionary]getIngredientsCount];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @autoreleasepool {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [[cell textLabel] setText:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    @autoreleasepool {
        PotionsAndIngredients *newView = [[PotionsAndIngredients alloc] init];
        newView.potionsArray = [[MainDictionary sharedDictionary] getArrayForKey:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
        newView.currentIngredientString = [[MainDictionary sharedDictionary] getIngredient: indexPath.row];
        [self presentViewController:newView animated:YES completion:NULL];
        newView = nil;
    }
}

@end
