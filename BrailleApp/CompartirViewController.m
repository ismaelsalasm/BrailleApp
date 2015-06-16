//
//  CompartirViewController.m
//  BrailleApp
//
//  Created by Ismael Salas Martos on 16/6/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import "CompartirViewController.h"
#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface CompartirViewController () <MFMessageComposeViewControllerDelegate>

@end

@implementation CompartirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)volverAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }    
}

@end
