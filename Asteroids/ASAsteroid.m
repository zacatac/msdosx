//
//  ASAsteroid.m
//  Asteroids
//
//  Created by Zack Field on 2/16/14.
//
//

#import "ASAsteroid.h"
#import "ASDrawable.h"
#import "ASShip.h"
#import "ASBullet.h"
@implementation ASAsteroid

@synthesize smallerAsteroids;

- (id)initLarge
{
    ASAsteroid *asteroid1 = [[ASAsteroid alloc] initMedium];
    ASAsteroid *asteroid2 = [[ASAsteroid alloc] initMedium];
    smallerAsteroids = [[NSArray alloc] initWithObjects: asteroid1,asteroid2,nil];
    return [super initWithImage:[NSImage imageNamed:@"asteroidLarge"]];
}

- (id)initMedium
{
    ASAsteroid *asteroid1 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid2 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid3 = [[ASAsteroid alloc] initSmall];
    smallerAsteroids = [[NSArray alloc] initWithObjects:asteroid1, asteroid2, asteroid3, nil];
    return [super initWithImage:[NSImage imageNamed:@"asteroidMedium"]];
}

- (id)initSmall
{
    smallerAsteroids = [[NSArray alloc] init];
    return [super initWithImage:[NSImage imageNamed:@"asteroidSmall"]];
}

- (void) update{
    for (ASDrawable *drawable in self.view.drawables)
    {
        if ([drawable isKindOfClass:[ASShip class]] &&
            [drawable collidesWith:self])
        {
            ASShip *ship = (ASShip *) drawable;
            if (ship.shield == nil) {
                [ship die];
            }
        }
        else if ([drawable isKindOfClass:[ASBullet class]] && [drawable collidesWith:self])
        {
            [drawable die];
            for (ASAsteroid *asteroid in smallerAsteroids)
            {
                asteroid.x = self.x;
                asteroid.y = self.y;
                asteroid.xVelocity = self.xVelocity + (rand() % 7) - 3;
                asteroid.yVelocity = self.yVelocity + (rand() % 7) - 3;
                [self.view addDrawable:asteroid];
                [asteroid release];
            }
            [self die];
        }
    }
}

- (void) dealloc
{
    [smallerAsteroids release];
    [super dealloc];
}
@end
