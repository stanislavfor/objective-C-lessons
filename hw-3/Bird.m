#import "Bird.h"
#import "Nest.h"

@implementation Bird

- (void)dealloc {
    NSLog(@"Bird was dealloc");
    [_nest release];
    [super dealloc];
}

- (void)fly {
    NSLog(@"The Bird was flying");
}

- (void)fall {
    NSLog(@"The Bird was falling");
}

- (void)eat {
    NSLog(@"The Bird was eating");
}

@end