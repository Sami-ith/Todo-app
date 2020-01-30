//
//  addViewController.h
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface addViewController : UIViewController
{
    NSMutableArray *incompleteTask;
    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDone;
@property (weak, nonatomic) IBOutlet UITextField *item;


@end

NS_ASSUME_NONNULL_END
