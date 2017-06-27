//
//  ViewController.m
//  demo_autoreleasing修饰
//
//  Created by  huzhongyin on 17/6/27.
//  Copyright © 2017年 LanGe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void) generateErrorInVariable:(__autoreleasing NSError **)paramError{
    NSArray *objects = [[NSArray alloc] initWithObjects:@"A simple error", nil];
    NSArray *keys = [[NSArray alloc] initWithObjects:NSLocalizedDescriptionKey, nil];
    NSDictionary *errorDictionary = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    *paramError = [[NSError alloc] initWithDomain:@"MyApp" code:1 userInfo:errorDictionary];
}
-(void)test
{
    NSError *error = nil;
    [self generateErrorInVariable:&error];
    NSLog(@"Error = %@", error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
