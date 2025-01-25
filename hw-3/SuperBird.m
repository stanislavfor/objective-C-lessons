#import "SuperBird.h"

@implementation SuperBird

- (void)fly {
    NSLog(@"The Superbird was flying");
}

- (void)fall {
    NSLog(@"The Superbird was falling");
}

- (void)eat {
    NSLog(@"The Superbird was eating");
}

- (void)dealloc {
    NSLog(@"Superbird was dealloc");
    [super dealloc];
}

@end