//
//  CodificacionBraille.h
//  BrailleApp
//
//  Created by Ismael Salas Martos on 8/5/15.
//  Copyright (c) 2015 Ismael Salas Martos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodificacionBraille : NSObject

@property (nonatomic, strong) NSDictionary *dictMinusculas;
@property (nonatomic, strong) NSDictionary *dictMayusculas;
@property (nonatomic, strong) NSDictionary *dictNumeros;

- (NSString*)letraConCodificacion:(NSArray *)Codificacion usarDictionary:(NSString *)usarDictionary;


@end

