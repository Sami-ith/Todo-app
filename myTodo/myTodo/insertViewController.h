//
//  insertViewController.h
//  myTodo
//
//  Created by Samieh Sadeghi on 2020-01-22.
//  Copyright © 2020 Samieh Sadeghi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface insertViewController : UIViewController
{
    NSMutableArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UITextField *descTxt;

@end

NS_ASSUME_NONNULL_END
