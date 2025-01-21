#import <Foundation/Foundation.h>
#import <math.h>

void solveQuadraticEquation(double a, double b, double c) {
    double discriminant = b * b - 4 * a * c;

    if (discriminant > 0) {
        double root1 = (-b + sqrt(discriminant)) / (2 * a);
        double root2 = (-b - sqrt(discriminant)) / (2 * a);
        NSLog(@"Roots: %.2f and %.2f", root1, root2);
    } else if (discriminant == 0) {
        double root = -b / (2 * a);
        NSLog(@"Root: %.2f", root);
    } else {
        NSLog(@"Roots < 0");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // x^2 – 8x + 12 = 0
        solveQuadraticEquation(1, -8, 12);

        // 12x^2 – 4x + 2 = 0
        solveQuadraticEquation(12, -4, 2);

        // x^2 – 100x - 2 = 0
        solveQuadraticEquation(1, -100, -2);
    }
    return 0;
}
