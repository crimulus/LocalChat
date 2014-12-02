//
//  ViewController.m
//  LocalChat
//
//  Created by Tharp, Jeremy on 11/20/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int currentOffsetForKeyboard;
}

@end

@implementation ViewController


- (void)viewDidLoad {

    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    UITapGestureRecognizer *tap = [
                                   [UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(hideTheObnoxiousFreakingKeyboard)
                                   ];
    [self.view addGestureRecognizer:tap];
    currentOffsetForKeyboard = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideTheObnoxiousFreakingKeyboard];
    return NO;
}

- (void)hideTheObnoxiousFreakingKeyboard {
    [self.textEntry resignFirstResponder];
    [self.messagesTextView resignFirstResponder];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.2
                     animations:^{
                        self.textEntryView.center = CGPointMake(
                            self.textEntryView.center.x,
                            (self.textEntryView.center.y + currentOffsetForKeyboard) - keyboardSize.height
                        );
                     }];
    currentOffsetForKeyboard = keyboardSize.height;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [UIView
     animateWithDuration:0.01
     animations:^{
         self.textEntryView.center = CGPointMake(
                                                 self.textEntryView.center.x,
                                                 self.textEntryView.center.y + keyboardSize.height
                                                 );
     }];
    currentOffsetForKeyboard = 0;
}

@end
