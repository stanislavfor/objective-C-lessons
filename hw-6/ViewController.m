#import "ViewController.h"
#import "SecondViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation ViewController

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(swizzled_viewDidLoad);

        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)swizzled_viewDidLoad {
    [self swizzled_viewDidLoad];
    NSLog(@"Swizzled viewDidLoad");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];

    self.view.backgroundColor = [UIColor whiteColor];

    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter text";
    [self.view addSubview:self.textField];

    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, 300, 100)];
    self.textView.editable = NO;
    [self.view addSubview:self.textView];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    saveButton.frame = CGRectMake(20, 260, 100, 40);
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];

    UIButton *forwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    forwardButton.frame = CGRectMake(20, 310, 100, 40);
    [forwardButton setTitle:@"FORWARD" forState:UIControlStateNormal];
    [forwardButton addTarget:self action:@selector(forwardToSecondScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forwardButton];

    NSString *savedText = [self.userDefaults stringForKey:@"savedText"];
    if (savedText) {
        self.textField.text = savedText;
        self.textView.text = savedText;
    }
}

- (void)saveText {
    @try {
        [self.userDefaults setObject:self.textField.text forKey:@"savedText"];
        [self.userDefaults synchronize];
        self.textView.text = self.textField.text;
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

- (void)forwardToSecondScreen {
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)resetDefaults {
    NSDictionary *dict = [self.userDefaults dictionaryRepresentation];
    for (id key in dict) {
        [self.userDefaults removeObjectForKey:key];
    }
    [self.userDefaults synchronize];
}

@end
