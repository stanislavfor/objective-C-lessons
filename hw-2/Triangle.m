#import "Triangle.h"
#import <math.h>

@implementation Triangle

- (instancetype)initWithSideA:(float)a sideB:(float)b sideC:(float)c {
    self = [super init];
    if (self) {
        _sideA = a;
        _sideB = b;
        _sideC = c;
    }
    return self;
}

- (double)calculateArea {
    float s = (self.sideA + self.sideB + self.sideC) / 2;
    return sqrt(s * (s - self.sideA) * (s - self.sideB) * (s - self.sideC));
}

- (float)calculatePerimeter {
    return self.sideA + self.sideB + self.sideC;
}

- (void)displayInfo {
    NSLog(@"For the Triangle, sides: %.2f, %.2f, %.2f, area: %.2f, perimeter: %.2f",
          self.sideA, self.sideB, self.sideC, [self calculateArea], [self calculatePerimeter]);
}

@end