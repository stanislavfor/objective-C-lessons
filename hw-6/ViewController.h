#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) NSUserDefaults *userDefaults;
- (void)resetDefaults;
@end
