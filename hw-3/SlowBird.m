#import "SlowBird.h"

@implementation SlowBird

- (void)fly {
    NSLog(@"The Slowbird was flying");
}

- (void)fall {
    NSLog(@"The Slowbird was falling");
}

- (void)eat {
    NSLog(@"The Slowbird was eating");
}

- (void)dealloc {
    NSLog(@"SlowBird was dealloc");
    [super dealloc];
}

@end