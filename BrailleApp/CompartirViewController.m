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

@interface CompartirViewController () <UITextFieldDelegate, MFMessageComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextView *mensajeTextView;

@end

@implementation CompartirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mensajeTextView.text = self.frase;
    
    //[self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];
    
    // Funciones para esconder el teclado estandar.
    
    self.mensajeTextField.delegate = self;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    // Función que determina la velocidad de la voz.
    
    // Voz lenta:
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.frase];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    // Voz rápida:
    
    //AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.frase];
    //utterance.rate = AVSpeechUtteranceMaximumSpeechRate;
    
    // Idiomas a elegir:
    
    //AVSpeechSynthesisVoice *synthesizer_voice_fr = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
    //AVSpeechSynthesisVoice *synthesizer_voice_en = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
    
   
}

- (void)hideKeyBoard {
    [_mensajeTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.mensajeTextField resignFirstResponder];
    return YES;
}


    //[self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];

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

/*- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }    
}*/

/*- (IBAction)enviarSMS:(id)sender {
    [self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];
}*/

- (IBAction)Borrar:(id)sender{

    self.mensajeTextView.text = @"";
    self.frase = @"";
    
    self.parent.frase = @"";
    self.parent.mensajeTextField.text = @"";
    
    NSLog(@"Frase: %@",self.mensajeTextView.text);
}

- (IBAction)sendMailCocoa:(id)sender
// Create a mail message in the user's preferred mail client
// by opening a mailto URL. The extended mailto URL format
// is documented by RFC 2368 and is supported by Mail.app
// and other modern mail clients.
//
// This routine's prototype makes it easy to connect it as
// the action of a user interface object in Interface Builder.
{
    NSURL *     url;
    
    // Create the URL.
    
    url = [NSURL URLWithString:@"mailto:dts@apple.com"
           "?subject=Hello%20Cruel%20World!"
           "&body=Share%20and%20Enjoy"
           ];
    assert(url != nil);
    
    // Open the URL
    
//- (void) [[NSWorkspace sharedWorkspace] openURL:url];
}



/*NSURL *facebookURL = [NSURL URLWithString:@"fb://friends"];
if ([[UIApplication sharedApplication] canOpenURL:facebookURL]) {
    [[UIApplication sharedApplication] openURL:facebookURL];
}*/

@end
