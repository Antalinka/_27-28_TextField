//
//  GRViewController.h
//  _27-28_TextField
//
//  Created by Exo-terminal on 6/10/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelText;

@end
