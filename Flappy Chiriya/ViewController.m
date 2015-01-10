//
//  ViewController.m
//  Flappy Chiriya
//
//  Created by Ali Hockla on 1/9/15.
//  Copyright (c) 2015 Ali Hockla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumber];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
