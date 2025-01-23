#import <Foundation/Foundation.h>

double findMax(double a, double b, double c) {
    double max = a;
    if (b > max) {
        max = b;
    }
    if (c > max) {
        max = c;
    }
    return max;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Любые три числа
        double num1 = 5.5;
        double num2 = 20.3;
        double num3 = 13.7;
        
        double maxNum = findMax(num1, num2, num3);        
        NSLog(@"There're the numbers : %f, %f, and %f, where is a max-number: %f", num1, num2, num3, maxNum);
    }
    return 0;
}
