//
//  GRViewController.m
//  _27-28_TextField
//
//  Created by Exo-terminal on 6/10/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()
@property(assign, nonatomic)int i;

@end

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Edit - 

- (BOOL) editPhone:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
    }
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    newString = [validComponents componentsJoinedByString:@""];
    
    
    
    static const int localNumberMaxLenght = 7;
    static const int areaCodeMaxLenght = 3;
    static const int coutryCodeMaxLenght = 3;
    
    
    if ([newString length] > localNumberMaxLenght + areaCodeMaxLenght + coutryCodeMaxLenght) {
        return NO;
    }
    
    NSMutableString* resultString = [NSMutableString string];
    
    NSInteger localNumberLenght = MIN([newString length], localNumberMaxLenght);
    
    if (localNumberLenght > 0) {
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLenght];
        [resultString appendString:number];
        
        if ([resultString length] > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if ([newString length] > localNumberMaxLenght) {
        
        NSInteger areaCodeLenght = MIN((int)[newString length] - localNumberMaxLenght, areaCodeMaxLenght);
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLenght - areaCodeLenght, areaCodeLenght);
        NSString* area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        [resultString insertString:area atIndex:0];
    }
    if ([newString length] > localNumberMaxLenght + coutryCodeMaxLenght) {
        
        NSInteger coutryCodeLenght = MIN((int)[newString length] - localNumberMaxLenght - coutryCodeMaxLenght, coutryCodeMaxLenght);
        NSRange countryCodeRange = NSMakeRange(0,coutryCodeLenght);
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        [resultString insertString:countryCode atIndex:0];
    }
    
    textField.text = resultString;
    
    return NO;
}


-(BOOL)editMail:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSArray* errorSymbol = [NSArray arrayWithObjects:@"~",@" ",@"/",@"(",@"[",@"^",@"<",@">",@")",@"(",@")",@",",@";",@"]",@"+",@"=",@"\\",
                            @"|",@"'",@"{",@"}",@"%",@"*",@"#",@"$",@"!",@"&",@"*", nil];
    
    for (NSString* errorString in errorSymbol) {
        
        if ([string isEqualToString:errorString]) {
            return NO;
        }
        
    }
    
    NSCharacterSet* newSet = [NSCharacterSet characterSetWithCharactersInString:@"@"];
    NSArray* separatedArray = [newString componentsSeparatedByCharactersInSet:newSet];
    
    if ([separatedArray count] > 2) {
        return NO;
    }
    
    

   return [newString length] < 30;
}

#pragma mark - UITextFieldDelegate -


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    for (int i = 0; i < ([self.textFieldCollection count]-1) ; i++) {
        
        
        if (!([textField isEqual:[self.textFieldCollection objectAtIndex:i]]))  {
            
           [textField resignFirstResponder];
            
        }else{
            
            [[self.textFieldCollection objectAtIndex:i+1] becomeFirstResponder];
            
        }
        
    }
     return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

        for (UILabel *label in self.labelText) {
            
            if (textField.tag == label.tag) {
                label.text = [textField.text stringByReplacingCharactersInRange:range withString:string];
                NSLog(@"%@", label.text);
            }
        }
    
    if ([textField isEqual:[self.textFieldCollection objectAtIndex:5]]) {
        
     return  [self editPhone:textField shouldChangeCharactersInRange:range replacementString:string];
        
    }else if([textField isEqual:[self.textFieldCollection objectAtIndex:6]]){
        
         return [self editMail:textField shouldChangeCharactersInRange:range replacementString:string];
        
    }else{
        return YES;

    }
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    
    for (UILabel *label in self.labelText) {
        
        if (textField.tag == label.tag) {
            label.text = nil;
        }
        
    }
    
    return YES;
}
@end
