#import <Foundation/Foundation.h>
#import "Bird.h"
#import "SuperBird.h"
#import "SlowBird.h"
#import "Nest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Bird *bird = [[Bird alloc] init];
        Nest *nest = [[Nest alloc] init];
        bird.nest = nest;
        
        NSLog(@"The Bird =");
        [bird fly];
        [bird fall];
        [bird eat];

        SlowBird *slowBird = [[SlowBird alloc] init];
        NSLog(@"The Slowbird =");
        [slowBird fly];
        [slowBird fall];
        [slowBird eat];

        SuperBird *superBird = [[SuperBird alloc] init];
        NSLog(@"The Superbird =");
        [superBird fly];
        [superBird fall];
        [superBird eat];
    
        //SuperBird *superBird = [[SuperBird alloc] init];
        //SlowBird *slowBird = [[SlowBird alloc] init];
        
        //Nest *nest = [[Nest alloc] init];
        //nest.bird = superBird;
        //nest.area = 10.0;
        //nest.occupancy = 1;
        
        //[superBird fly];
        //[slowBird fly];
       
        //__weak Nest *weakNest = nest; // Слабая ссылка weak избежать retain cycle         
        //NSLog(@"A bird is with an area nest : %f", weakNest.area);  
        
        // Циклы удержания, связь между птицей и гнездом
        bird.nest.bird = bird;
        nest.bird = bird;
        
        // Очистка памяти
        [superBird release];
        [slowBird release];
        [nest release];
        [bird release];
    }
    return 0;
}