#import "Circle.h"

@implementation Circle

- (instancetype)initWithRadius:(float)radius {
    self = [super init];
    if (self) {
        _radius = radius;
    }
    return self;
}

- (float)calculateArea {
    return M_PI * self.radius * self.radius;
}

- (float)calculatePerimeter {
    return 2 * M_PI * self.radius;
}

- (void)displayInfo {
    NSLog(@"For the Circle, radius: %.2f, area: %.2f, perimeter: %.2f",
          self.radius, [self calculateArea], [self calculatePerimeter]);
}

@end