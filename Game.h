//
//  Game.h
//  Flappy Chiriya
//
//  Created by Ali Hockla on 1/9/15.
//  Copyright (c) 2015 Ali Hockla. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;

@interface Game : UIViewController {
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    
    NSTimer *BirdMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;

@end
