//
//  ViewController.m
//  App
//
//  Created by Raul Quispe on 11/16/18.
//  Copyright © 2018 tcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//variables expuestas a otras clases
@property(nonatomic,strong) NSString*username;//@"value"
@property(nonatomic,strong) NSNumber*age;//@value


@end

@implementation ViewController{
    //variables globales y locales en mi clase
    double height;// declaracion de primitivos
    int width;
    NSString *lastaname;
    NSArray*numeros;
    NSMutableArray*numerosIlimitado;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString*numbers = @"123+231-100+500+9-3";//para operacion
//    NSRange range = [numbers rangeOfString:@"231"];
//    NSLog(@"%lu %lu",(unsigned long)range.location,(unsigned long)range.length);
    NSArray*lista = [self convertToArray:numbers];
    int counterOperator = 0;
    NSMutableArray*numbersInt = [[NSMutableArray alloc] init];
    NSMutableString*cadenaNumber = [[NSMutableString alloc] init];
    NSMutableArray*operators = [[NSMutableArray alloc] init];
    for (int i =0; i < [lista count]; i++) {
        if (![lista[i] isEqualToString:@"+"] && ![lista[i] isEqualToString:@"-"]) {
            //soy un numero
            [cadenaNumber appendString: lista[i]];
            numbersInt[counterOperator] = cadenaNumber;
            NSLog(@"Numero: %@",cadenaNumber);
        }else{
            counterOperator = counterOperator + 1;
            cadenaNumber = [[NSMutableString alloc] init];
            [operators addObject: lista[i]];
            //una operador
            NSLog(@"Operador: %@",lista[i]);
        }
    }
    int result = [self operations:operators withValues:numbersInt];
    NSLog(@"Mi Resultado: %d",result);
}
-(int)operations:(NSArray*)oparations withValues:(NSArray*)values{
    int counterOperating = 1;
    int resultOperating = [[values firstObject] intValue];
    for (NSString*strOperator in oparations) {
        if ([strOperator isEqualToString:@"+"]) {
            resultOperating = resultOperating + [values[counterOperating] intValue];
            counterOperating=counterOperating+1;
        }
        if ([strOperator isEqualToString:@"-"]) {
            resultOperating = resultOperating - [values[counterOperating] intValue];
            counterOperating=counterOperating+1;
        }
        
    }
    return resultOperating;
    
}

-(NSArray *)convertToArray:(NSString*)cadena
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i=0; i < cadena.length; i++) {
        NSString *tmp_str = [cadena substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:[tmp_str stringByRemovingPercentEncoding]];
        NSLog(@"%@",tmp_str);
    }
    return arr;
}
/*
 Trabajar con arreglos
 */
-(void)exampleThree{
    int valueA = 10;
    int valueB = 20;
    int operation = [self addtion:valueA valueB:valueB valueC:0];
    NSLog(@"%d",operation);
}
-(uint)addtion:(int)a valueB:(int)b valueC:(int)c{
    uint result;
    if (c > 0) {
        result = a + b / c;
    }else{
        result = a + b;
    }
    
    return result;
}
-(void)exampleTwo{
    NSNumber*initValue = [[NSNumber alloc] init];
    initValue = @1;
    numeros = [[NSArray alloc] initWithObjects:initValue,@2,@3,@4,@5,@6, nil];
    initValue = @3;
    for (NSNumber*value in numeros) {
        NSLog(@"valores: %@",(NSString*)value);
    }
    
    numerosIlimitado = [[NSMutableArray alloc] initWithObjects:initValue, nil];
    initValue = @8;
    [numerosIlimitado addObject:@3];
    [numerosIlimitado addObject:@4];
    [numerosIlimitado addObject:@10];
    for (NSNumber*value in numerosIlimitado) {
        NSLog(@"mutable valores: %@",(NSString*)value);
    }
    /*
     Averiguar por que no cambia de valor initValue en el arreglo
    */
}
-(void)exampleOne{
    self.username = [[NSString alloc] init];//esta es la manera correcta de instanciar un objeto
    [self setUsername:@""];
    self.username = @"pepito";
    //read
    NSLog(@"%@",self.username);
    NSLog(@"%@",[self username]);
    
    if ([[self username] isEqualToString:@"raul"]) {
        NSLog(@"es igual a raul");
    } else {
        NSLog(@"No es igual");
    }
    _age = @2;
    NSLog(@"%@",(NSString*)_age);//casting
}

@end
