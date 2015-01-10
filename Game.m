//
//  Game.m
//  Flappy Chiriya
//
//  Created by Ali Hockla on 1/9/15.
//  Copyright (c) 2015 Ali Hockla. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game


-(IBAction)StartGame:(id)sender {
    
    StartGame.hidden = YES;
    
    BirdMovement = [ NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving)userInfo:nil repeats:YES];
}


-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if (BirdFlight > 0) {
        Bird.image = [UIImage imageNamed:@"Bird Up.png"];
    }
    
    if (BirdFlight < 0) {
        Bird.image = [UIImage imageNamed:@"Bird Down.png"];

    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 30;
    
}
    
    


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

@end
