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
@property (weak, nonatomic) IBOutlet UIButton *btnBorrar;
@property (weak, nonatomic) IBOutlet UIButton *btnVolver;
@property (weak, nonatomic) IBOutlet UIButton *btnCopiar;
@property (weak, nonatomic) IBOutlet UIButton *btnMail;

@end

@implementation CompartirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mensajeTextView.text = self.frase;
    
    //[self sendSMS:self.frase recipientList:[NSArray arrayWithObjects: nil]];
    
    // Funciones para esconder el teclado estandar.
    
    self.mensajeTextField.delegate = self;
    
    
    [self.btnBorrar addTarget:self action:@selector(haceBorrar:withEvent:)
     forControlEvents:UIControlEventTouchDownRepeat];
    [self.btnVolver addTarget:self action:@selector(haceVolver:withEvent:)
     forControlEvents:UIControlEventTouchDownRepeat];
    [self.btnCopiar addTarget:self action:@selector(haceCopiar:withEvent:)
     forControlEvents:UIControlEventTouchDownRepeat];
    [self.btnMail addTarget:self action:@selector(haceMail:withEvent:)
     forControlEvents:UIControlEventTouchDownRepeat];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(haceRepetir)];
    
    //modify this number to recognizer number of tap
    [singleTap setNumberOfTapsRequired:1];
    [self.mensajeTextView addGestureRecognizer:singleTap];

    [self.btnVolver.titleLabel setTextAlignment: NSTextAlignmentCenter];
    
    
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
//    [self dismissViewControllerAnimated:YES completion:nil];
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
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Borrar"];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;

    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
}
- (IBAction)Volver:(id)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Volver al Teclado"];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
}
- (IBAction)Copiar:(id)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Copiar en Portapapeles"];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
}
- (IBAction)Mail:(id)sender {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Enviar correo"];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
}

-(IBAction)haceBorrar:(id)sender withEvent:(UIEvent*)event {
    UITouch* touch = [[event allTouches] anyObject];
    if (touch.tapCount == 2) {
        // do action.
        self.mensajeTextView.text = @"";
        self.frase = @"";
        
        self.parent.frase = @"";
        self.parent.mensajeTextField.text = @"";
        
        NSLog(@"Frase: %@",self.mensajeTextView.text);
    }
}

-(IBAction)haceRepetir{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.frase];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.parent.synthesizer speakUtterance:utterance];
}

-(IBAction)haceVolver:(id)sender withEvent:(UIEvent*)event {
    UITouch* touch = [[event allTouches] anyObject];
    if (touch.tapCount == 2) {
        // do action.
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(IBAction)haceCopiar:(id)sender withEvent:(UIEvent*)event {
    UITouch* touch = [[event allTouches] anyObject];
    if (touch.tapCount == 2) {
        NSString *copyStringverse = self.mensajeTextView.text;
        UIPasteboard *pb = [UIPasteboard generalPasteboard];
        [pb setString:copyStringverse];
    }
}

-(IBAction)haceMail:(id)sender withEvent:(UIEvent*)event {
    UITouch* touch = [[event allTouches] anyObject];
    if (touch.tapCount == 2) {

        // Email Subject
        NSString *emailTitle = @"BrailleApp Text";
        // Email Content
        NSString *messageBody = self.frase;
        // To address
        NSArray *toRecipents = nil;
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];

    }
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

    

}


#pragma mark - mail compose delegate

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/*NSURL *facebookURL = [NSURL URLWithString:@"fb://friends"];
if ([[UIApplication sharedApplication] canOpenURL:facebookURL]) {
    [[UIApplication sharedApplication] openURL:facebookURL];
}*/

@end
