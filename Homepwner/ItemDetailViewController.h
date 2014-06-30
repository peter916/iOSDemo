//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by peter on 14-6-26.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Possession.h"

@interface ItemDetailViewController : UIViewController{

    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
}

@property (retain,nonatomic)Possession *possession;
@end
