//
//  ViewController.m
//  Cat-Tom
//
//  Created by 孙翔宇 on 15/4/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation ViewController

-(void) tomAnimationWithName:(NSString *) name count:(NSInteger *)count
{
    if ([self.tom isAnimating]) {
        return;
    }
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:image];
    }
    
    self.tom.animationImages = arrayM;
    self.tom.animationRepeatCount = 1;
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;
    
    [self.tom startAnimating];
    
}


- (IBAction)eatAction:(id)sender {
    [self tomAnimationWithName:@"eat" count:40];
}

@end
