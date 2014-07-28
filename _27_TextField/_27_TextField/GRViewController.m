//
//  GRViewController.m
//  _27_TextField
//
//  Created by Exo-terminal on 6/6/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    self.lastNameField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    [self.firstNameField becomeFirstResponder];
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];

    
    
   /* UIKIT_EXTERN NSString *const UITextFieldTextDidBeginEditingNotification;
    UIKIT_EXTERN NSString *const UITextFieldTextDidEndEditingNotification;
    UIKIT_EXTERN NSString *const UITextFieldTextDidChangeNotification;*/
}




- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionLog:(id)sender {
    
    NSLog(@"First name - %@, last name - %@",self.firstNameField.text, self.lastNameField.text);
    
    if ([self.firstNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    }else if([ self.lastNameField isFirstResponder]){
        [self.lastNameField resignFirstResponder];
    }
}

- (IBAction)actionTextChanged:(UITextField *)sender {
    
    NSLog(@"%@", sender.text);
}

#pragma mark - Notification -
-(void)notificationTextDidBeginEditing:(NSNotification*)notification{
    NSLog(@"Text Did Begin Editing");
}

-(void)notificationTextDidEndEditing:(NSNotification*)notification{
    NSLog(@"notification Text Did EndEditing");
}

-(void)notificationTextDidChangeEditing:(NSNotification*)notification{
    NSLog(@"notification Text Did ChangeEditing");
}


#pragma mark - UITextFieldDelegate -

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
-;           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text*/


/*-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return [textField isEqual:self.firstNameField];
}*/

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}


@end
