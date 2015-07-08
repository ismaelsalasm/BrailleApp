//
//  ViewController.m
//  BrailleApp
//
//  Created by Ismael Salas Martos on 16/4/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import "ViewController.h"
#import "CompartirViewController.h"

#import "CodificacionBraille.h"



@interface ViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate>

// Declaración de propiedades de los valores de los botones y del tiempo de detección.

@property (nonatomic) NSNumber *valorBoton1;
@property (nonatomic) NSNumber *valorBoton2;
@property (nonatomic) NSNumber *valorBoton3;
@property (nonatomic) NSNumber *valorBoton4;
@property (nonatomic) NSNumber *valorBoton5;
@property (nonatomic) NSNumber *valorBoton6;

@property (nonatomic) BOOL usarMayuscula;
@property (nonatomic) BOOL usarNumeros;

- (void) handleSwipe:(UISwipeGestureRecognizer *)recognizer;



@property (strong, nonatomic) NSTimer *tiempoDeteccion;

// Declaración contador Timer.

- (void) startTimer;

@end

// Definición del tiempo de detección.

#define TIMER_TIME 0.3 //10ms


@implementation ViewController

@synthesize button1=_button1;
@synthesize tocaButton1=_tocaButton1;

// Detecta el View pulsado

-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInView:self.view];
    if (CGRectContainsPoint(_button1.frame, loc)){
        NSLog(@"detectado!");
        _tocaButton1 = YES;
        
    }}
/*-(void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
 UITouch *touch = [touches anyObject];
 CGPoint loc = [touch locationInView:self.view];
 if (_tocaButton1){
 self.button1.center = loc;
 }
 }*/
-(void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    _tocaButton1 = YES;
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches cancelled.");
    _tocaButton1 = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.(Acciones después de que se haya cargado la Vista)
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    self.frase=@"";
    
    self.usarMayuscula = NO;
    self.usarNumeros = NO;
    
    // Resetear el estado de los Botones: todos a NO.
    
     [self resetButtonStates];
    
    // Funciones para esconder el teclado estandar.
    
    self.mensajeTextField.delegate = self;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];

    // Función para pasar a la otra pantalla:
    
    UISwipeGestureRecognizer * swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRecognizer.numberOfTouchesRequired = 2;
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRecognizer.delegate = self;
    [self.view addGestureRecognizer:swipeRecognizer];
    
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Braille Ap"];
    utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
    
    AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
    
    utterance.voice = synthesizer_voice_es;
    
    [self.synthesizer speakUtterance:utterance];
}

- (void)hideKeyBoard {
        [_mensajeTextField resignFirstResponder];
    }

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.mensajeTextField resignFirstResponder];
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

// Función contador Timer (detecta que botones se han pulsado dentro del tiempo de detección).

- (void) startTimer {
    self.tiempoDeteccion = [NSTimer scheduledTimerWithTimeInterval:TIMER_TIME target:self selector:@selector(checkButton) userInfo:nil repeats:NO];

    //Función para no bloquear el contador Timer.
    
    [[NSRunLoop currentRunLoop] addTimer:self.tiempoDeteccion forMode:NSRunLoopCommonModes];
}

// Función que comprueba el estado de los botones y devuelve el valor (comprueba que botones se pulsan).


- (void) checkButton {
    
    CodificacionBraille *codificacionBraile = [[CodificacionBraille alloc] init];
    
    NSString *usarDictionario = @"dictMinusculas";
    if (self.usarNumeros) {
        usarDictionario = @"dictNumeros";
    }else if (self.usarMayuscula){
        usarDictionario = @"dictMayusculas";
        self.usarMayuscula = NO;
    }
    
    NSString *value = [codificacionBraile letraConCodificacion:@[self.valorBoton1,self.valorBoton2,self.valorBoton3,self.valorBoton4,self.valorBoton5,self.valorBoton6] usarDictionary:usarDictionario];
    
    //Para cambiar a dictMayuscula o dictNumero con sus prefijos
    
    if ([value isEqual:@"ª"]){
        self.usarNumeros = YES;
        
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Numero"];
        utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
        AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
        utterance.voice = synthesizer_voice_es;
        [self.synthesizer speakUtterance:utterance];
    }else if ([value isEqual:@"º"]){
        self.usarMayuscula = YES;
        
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Mayusculas"];
        utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
        AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
        utterance.voice = synthesizer_voice_es;
        [self.synthesizer speakUtterance:utterance];
    }
    else{
        
        if ([value isEqual:@" "]){
            self.usarNumeros = NO;
            
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Espacio"];
            utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
            AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
            utterance.voice = synthesizer_voice_es;
            [self.synthesizer speakUtterance:utterance];
        }
        
        
        NSLog(@"Respuesta: %@",value);
        
        // Funciones para borrar el último carácter o la palabra entera:
        
        if ([value isEqual:@"∞"]) {
            if ([self.frase length] > 0) {
                self.frase = [self.frase substringToIndex:[self.frase length] - 1];
                
                AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Borrar Caracter"];
                utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
                AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
                utterance.voice = synthesizer_voice_es;
                [self.synthesizer speakUtterance:utterance];
            } else {
                
                //no characters to delete... attempting to do so will result in a crash
            }
        } else if ([value isEqual:@"∞∞"]){
            self.frase = @"";
            
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Borrar"];
            utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
            AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
            utterance.voice = synthesizer_voice_es;
            [self.synthesizer speakUtterance:utterance];
            
        } else if ([value isEqual:@"|"]){
            
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Posición correcta"];
            utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
            AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
            utterance.voice = synthesizer_voice_es;
            [self.synthesizer speakUtterance:utterance];
            
        } 
        else{
            self.frase = [self.frase stringByAppendingString:value];
        }
        
        NSLog(@"Frase: %@",self.frase);
        
        
        self.mensajeTextField.text = self.frase;
        
        
        
        // Función que determina la velocidad de la voz.
        
        // Voz lenta:
        
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:value];
        utterance.rate = AVSpeechUtteranceMaximumSpeechRate/7;
        
        // Voz rápida:
        
        //AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.frase];
        //utterance.rate = AVSpeechUtteranceMaximumSpeechRate;
        
        // Idiomas a elegir:
        
        //AVSpeechSynthesisVoice *synthesizer_voice_fr = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
        //AVSpeechSynthesisVoice *synthesizer_voice_en = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        AVSpeechSynthesisVoice *synthesizer_voice_es = [AVSpeechSynthesisVoice voiceWithLanguage:@"es-ES"];
        
        utterance.voice = synthesizer_voice_es;
        
        [self.synthesizer speakUtterance:utterance];
    }
    
    [self resetButtonStates];
    
    
}



// Función para resetear todos los botones a NO.

- (void) resetButtonStates {
    
    self.valorBoton1 = @NO;
    self.valorBoton2 = @NO;
    self.valorBoton3 = @NO;
    self.valorBoton4 = @NO;
    self.valorBoton5 = @NO;
    self.valorBoton6 = @NO;
}

// Conexiones de los botones con la acción de presionar botón (pone el valor del botón a YES cuando se presiona dentro del tiempo de detección)


- (IBAction)boton1Presionado:(id)sender
{
    self.valorBoton1=@YES;
    NSLog(@"He presionado el botón 1");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (IBAction)boton2Presionado:(id)sender
{
    self.valorBoton2 = @YES;
    NSLog(@"He presionado el botón 2");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (IBAction)boton3Presionado:(id)sender
{
    self.valorBoton3 = @YES;
    NSLog(@"He presionado el botón 3");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (IBAction)boton4Presionado:(id)sender
{
    self.valorBoton4 = @YES;
    NSLog(@"He presionado el botón 4");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (IBAction)boton5Presionado:(id)sender
{
    self.valorBoton5 = @YES;
    NSLog(@"He presionado el botón 5");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (IBAction)boton6Presionado:(id)sender
{
    self.valorBoton6 = @YES;
    NSLog(@"He presionado el botón 6");
    if(!self.tiempoDeteccion.valid) [self startTimer];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"show_compartir" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[CompartirViewController class]]) {
        CompartirViewController *rvc = (CompartirViewController *)segue.destinationViewController;
        rvc.frase = self.frase;
        rvc.parent = self;
    }
}

@end
