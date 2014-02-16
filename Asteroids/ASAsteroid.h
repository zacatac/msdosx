//
//  ASAsteroid.h
//  Asteroids
//
//  Created by Zack Field on 2/16/14.
//
//

#import <Foundation/Foundation.h>
#import "ASDrawable.h"

@interface ASAsteroid : ASDrawable
@property (retain) NSArray *smallerAsteroids;

- (id) initLarge;

- (void) update;
    
@end
