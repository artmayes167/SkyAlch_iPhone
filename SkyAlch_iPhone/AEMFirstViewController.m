//
//  AEMFirstViewController.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "AEMFirstViewController.h" // Ingredients
@interface AEMFirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end


@implementation AEMFirstViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    if (screenScale == 2.0f) self.tabBarItem.image = [UIImage imageNamed:@"Bowl.png"];
}

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
    
    [cell textLabel].lineBreakMode = NSLineBreakByWordWrapping;
    [cell textLabel].numberOfLines = 0;
    [cell textLabel].font = [UIFont fontWithName:@"Helvetica Bold" size:16.0];
    [[cell textLabel] setText:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PotionsAndIngredients *newView = [[PotionsAndIngredients alloc] init];
    newView.delegate = self;
    newView.potionsArray = [[MainDictionary sharedDictionary] getArrayForKey:[[MainDictionary sharedDictionary] getIngredient: indexPath.row]];
    newView.currentIngredientString = [[MainDictionary sharedDictionary] getIngredient: indexPath.row];
    newView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
   
    [self presentViewController:newView animated:YES completion:NULL];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *charactersForSort = [[NSMutableArray alloc] init];
    NSArray *allIngredients = [[MainDictionary sharedDictionary] getIngredients];
    for (NSString *item in allIngredients)
    {
        if (![charactersForSort containsObject:[item substringToIndex:1]]) [charactersForSort addObject:[item substringToIndex:1]];
    }
    return charactersForSort;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    BOOL found = NO;
    NSUInteger rowToScrollTo = 0;
    NSArray *allIngredients = [[MainDictionary sharedDictionary] getIngredients];
    for (NSString *item in allIngredients)
    {
        if ([[item substringToIndex:1] isEqualToString:title])
            if (!found)
            {
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rowToScrollTo inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                found = YES;
                return rowToScrollTo;
            }
        rowToScrollTo++;
    }
    return rowToScrollTo;
}

-(void)potionsAndIngredientsControllerShouldBeDismissed:(PotionsAndIngredients *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
