//
//  ViewController.m
//  RomanConv
//
//  Created by Ankit Mishra on 17/02/16.
//  Copyright © 2016 Ankit Mishra. All rights reserved.
//

#import "ViewController.h"




@interface ViewController (){
    NSDictionary *r2n;
    NSDictionary *n2r;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
        r2n = [NSDictionary dictionaryWithObjectsAndKeys:
         [NSNumber numberWithInt:1000],@"M",
         [NSNumber numberWithInt:500],@"D",
         [NSNumber numberWithInt:100],@"C",
         [NSNumber numberWithInt:50],@"L",
         [NSNumber numberWithInt:10],@"X",
         [NSNumber numberWithInt:5],@"V",
         [NSNumber numberWithInt:1],@"I", nil];
    
    
    n2r = [NSDictionary dictionaryWithObjectsAndKeys:
           @"M", [NSNumber numberWithInt:1000],
           @"D", [NSNumber numberWithInt:500],
           @"C", [NSNumber numberWithInt:100],
           @"L", [NSNumber numberWithInt:50],
           @"X", [NSNumber numberWithInt:10],
           @"V", [NSNumber numberWithInt:5],
           @"I", [NSNumber numberWithInt:1],
           nil];
    
    
    // Initial Method to Be Called
    [self convertRomenIntoNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)convertRomenIntoNumber{
    
    // This program will take roman numerals and convert them into correct form.
    // If i have misunderstood some thing then please let me know.
    // For E.X I am assuming the correct Format of 9 is VIIII not IX.
    
    // Number which you want to convert into Correct Format
    NSString *num = @"IC";
    
    int total = 0;
    // array to store data
    NSMutableArray *temp = [NSMutableArray array];
    
    for(int i=0;i<num.length;i++){
        NSString *s = [NSString stringWithFormat:@"%c",[num characterAtIndex:i]];
        NSNumber *val = [r2n objectForKey:s];
        
        // initial
        if(temp.count == 0){
            [temp addObject:val];
        }
        else{
            // Check and take difference
            if([temp lastObject] < val){
                NSNumber *t = [temp lastObject];
                NSNumber *diff = [NSNumber numberWithInt:([val intValue] - [t intValue])];
                [temp removeLastObject];
                [temp addObject:diff];
            }
            else{
                // add
                [temp addObject:val];
            }
        }
    }
    
    // finally add all the data of array
    if(temp.count){
        for (int i=0; i<temp.count; i++) {
            total += [[temp objectAtIndex:i] intValue];
        }
    }

//    NSLog(@"%d",total);
    [self convertNumberIntoActualForm:[NSNumber numberWithInt:total]];
}


-(void)convertNumberIntoActualForm:(NSNumber *)num{
    
    NSMutableArray *arr = [NSMutableArray array];
    NSSortDescriptor *srtDes = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    for(id key in [[n2r allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObject:srtDes]]){
        
        int count = [num intValue]/[key intValue];
        for(int i=0;i<count;i++){
            [arr addObject:[n2r objectForKey:key]];
        }
        num = [NSNumber numberWithInt:([num intValue] - [key intValue]*count)];
    }
    
    NSLog(@"%@",[arr componentsJoinedByString:@""]);
    
    
}

@end
