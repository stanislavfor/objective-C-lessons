#import "Rectangle.h"

@implementation Rectangle

- (instancetype)initWithWidth:(float)width height:(float)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return self;
}

- (float)calculateArea {
    return self.width * self.height;
}

- (float)calculatePerimeter {
    return 2 * (self.width + self.height);
}

- (void)displayInfo {
    NSLog(@"For the Rectangle, width: %.2f, height: %.2f, area: %.2f, perimeter: %.2f",
          self.width, self.height, [self calculateArea], [self calculatePerimeter]);
}

@end