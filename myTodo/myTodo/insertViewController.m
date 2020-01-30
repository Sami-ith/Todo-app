//
//  insertViewController.m
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import "insertViewController.h"
#import "ViewController.h"

@interface insertViewController ()

@end

@implementation insertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     dataArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"myList"];
}
- (IBAction)insertInTbl:(id)sender {
    int i=dataArray.count;
    [dataArray insertObject:_descTxt.text atIndex:i];
     [[NSUserDefaults standardUserDefaults] setObject:dataArray forKey:@"myList"];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
