//
//  PotionsAndIngredients.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 4/11/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "PotionsAndIngredients.h"
#import "MainDictionary.h"

@interface PotionsAndIngredients ()
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTV;
@property (weak, nonatomic) IBOutlet UITableView *potionsTable;
@end

@implementation PotionsAndIngredients
@synthesize ingredientsTV = _ingredientsTV;
@synthesize potionsTable = _potionsTable;
@synthesize potionsArray = _potionsArray;
@synthesize currentIngredientString = _currentIngredientString;

-(void)setPotionsArray:(NSArray *)potionsArray{
    if (!_potionsArray) _potionsArray = [NSArray new];
    _potionsArray = potionsArray;
}

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
        
        [[cell textLabel] setText:[self.potionsArray objectAtIndex: indexPath.row]];
        
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.ingredientsTV setText:@""]; // forces textView to scroll back to top
    NSArray *ingredients = [[MainDictionary sharedDictionary] getIngredientsForPotion:[self.potionsArray objectAtIndex: indexPath.row]];
    [self.ingredientsTV setText:[ingredients componentsJoinedByString:@"\n"]];
}


#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationItem.title = self.currentIngredientString;
        
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.potionsTable selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
    NSArray *ingredients = [[MainDictionary sharedDictionary] getIngredientsForPotion:[self.potionsArray objectAtIndex: indexPath.row]];
    [self.ingredientsTV setText:[ingredients componentsJoinedByString:@"\n"]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self setIngredientsTV:nil];
    [self setPotionsTable:nil];
    [self setPotionsArray:nil];
    [self setCurrentIngredientString:nil];
    [super viewWillDisappear:YES];
}

- (void)dealloc
{
#ifdef DEBUG
	//NSLog(@"dealloc %@", self);
#endif
}
@end
