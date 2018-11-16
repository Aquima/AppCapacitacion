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
  //  [self exampleOne];
  //  [self exampleTwo];
    [self exampleThree];
    // Do any additional setup after loading the view, typically from a nib.
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
