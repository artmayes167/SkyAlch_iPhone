//
//  AEMFirstViewController.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMFirstViewController.h" // Ingredients

@implementation AEMFirstViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return  [[MainDictionary sharedDictionary]getIngredientsCount];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [[cell textLabel] setText:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
        PotionsAndIngredients *newView = [[PotionsAndIngredients alloc] init];
        newView.potionsArray = [[MainDictionary sharedDictionary] getArrayForKey:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
        newView.currentIngredientString = [[MainDictionary sharedDictionary] getIngredient: indexPath.row];
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:newView animated:YES completion:NULL];
    } else {
        [self presentModalViewController:newView animated:YES];
    }
    
        newView = nil;
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
        NSMutableArray *charactersForSort = [[NSMutableArray alloc] init];
        NSArray *ings = [[MainDictionary sharedDictionary] getIngredients];
        for (NSString *item in ings)
        {
            if (![charactersForSort containsObject:[item substringToIndex:1]])
            {
                [charactersForSort addObject:[item substringToIndex:1]];
            }
        }
        return charactersForSort;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    BOOL found = NO;
    NSInteger b = 0;
    NSArray *ings = [[MainDictionary sharedDictionary] getIngredients];
    for (NSString *item in ings)
    {
        if ([[item substringToIndex:1] isEqualToString:title])
            if (!found)
            {
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:b inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                found = YES;
            }
        b++;
    }
    return b;
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
