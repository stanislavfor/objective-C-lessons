#import <Foundation/Foundation.h>
#import "Bird.h"
#import "SuperBird.h"
#import "SlowBird.h"
#import "Nest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        SuperBird *superBird = [[SuperBird alloc] init];
        SlowBird *slowBird = [[SlowBird alloc] init];
        
        Nest *nest = [[Nest alloc] init];
        nest.bird = superBird;
        nest.area = 10.0;
        nest.occupancy = 1;
        
        [superBird fly];
        [slowBird fly];
       
        __weak Nest *weakNest = nest; // Слабая ссылка weak избежать retain cycle         
        NSLog(@"A bird is with an area nest : %f", weakNest.area);       
        
        [superBird release];
        [slowBird release];
        [nest release];
    }
    return 0;
}