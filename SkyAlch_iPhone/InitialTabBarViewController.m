//
//  InitialTabBarViewController.m
//  SkyAlch_iPhone
//
//  Created by Arthur Mayes on 2/14/13.
//
//

#import "InitialTabBarViewController.h"

@interface InitialTabBarViewController ()

@end

@implementation InitialTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (UIViewController *vC in self.viewControllers) {
        if ([vC isEqual:[self.viewControllers lastObject]]) {
            CGFloat screenScale = [[UIScreen mainScreen] scale];
            if (screenScale == 2.0f) self.tabBarItem.image = [UIImage imageNamed:@"Potion.png"];
        }
    }
}

@end
