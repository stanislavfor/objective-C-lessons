#import "Nest.h"
#import "Bird.h"

@implementation Nest

- (void)dealloc {
    NSLog(@"Nest was dealloc");
    [super dealloc];
}

@end