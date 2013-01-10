//
//  PotionsAndIngredients.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "PotionsAndIngredients.h"

@implementation PotionsAndIngredients
@synthesize ingredientsTV;
@synthesize potionsTable;
@synthesize currentIngredient;
@synthesize potionsArray;
@synthesize currentIngredientString;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{return 4;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        [[cell textLabel] setText:[potionsArray objectAtIndex: indexPath.row]];
        
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
        NSArray *array = [[MainDictionary sharedDictionary] getIngredientsForPotion:[potionsArray objectAtIndex: indexPath.row]];
        NSString *ingredients = @"";
        for (NSString *string in array) {
            ingredients = [ingredients stringByAppendingFormat:@"%@\n", string];
        }
        [ingredientsTV setText:ingredients];
        array = nil;
        ingredients = nil;
    
}


#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated{
   
        currentIngredient.text = currentIngredientString;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [potionsTable selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
        NSArray *ar = [[MainDictionary sharedDictionary] getIngredientsForPotion:[potionsArray objectAtIndex: indexPath.row]];
        NSString *ing = @"";
        for (NSString *string in ar) {
            ing = [ing stringByAppendingFormat:@"%@\n", string];
        }
        [ingredientsTV setText:ing];
        indexPath = nil;
        ar = nil;
        ing = nil;
    
    
    [super viewWillAppear:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self setIngredientsTV:nil];
    [self setPotionsTable:nil];
    [self setCurrentIngredient:nil];
    [self setPotionsArray:nil];
    [self setCurrentIngredientString:nil];
    [super viewWillDisappear:YES];
}

- (void)viewDidUnload
{
    [self setIngredientsTV:nil];
    [self setPotionsTable:nil];
    [self setCurrentIngredient:nil];
    [self setPotionsArray:nil];
    [self setCurrentIngredientString:nil];
    [super viewDidUnload];
}

- (IBAction)back:(id)sender {
    [super dismissModalViewControllerAnimated:YES];
}
@end
