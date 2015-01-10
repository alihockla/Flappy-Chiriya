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

-(void)GameOver {
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
}


-(void)Score {
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}


-(IBAction)StartGame:(id)sender {
    
    StartGame.hidden = YES;
    
    BirdMovement = [ NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving)userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    // increase 0.01 to 0.02 or 0.03 make tunnels move slower
}


-(void)TunnelMoving {
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if (TunnelTop.center.x < -28) { // Tunnel is off the screen to the left
        [self PlaceTunnels];
    }

    if (TunnelTop.center.x == 30) {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame)) { // if bird intersects top tunnel
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)) { // if bird intersects bottom tunnel
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame)) { // if bird intersects top of screen
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)) { // if bird intersects bottom of screen
        [self GameOver];
    }
    
}

-(void)PlaceTunnels {
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 657; // <- increase this # to make the tunnel space bigger
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);
    
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
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
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
