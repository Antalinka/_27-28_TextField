//
//  GRViewController.h
//  _27_TextField
//
//  Created by Exo-terminal on 6/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
- (IBAction)actionLog:(id)sender;
- (IBAction)actionTextChanged:(UITextField *)sender;

@end
