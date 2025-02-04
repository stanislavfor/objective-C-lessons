#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Loader.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];

    self.queryTextField = [[UITextField alloc] init];
    self.queryTextField.placeholder = @"GET Request";
    self.queryTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.queryTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.queryTextField];

    self.getButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.getButton setTitle:@"GET" forState:UIControlStateNormal];
    [self.getButton addTarget:self action:@selector(getButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.getButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.getButton];

    self.forwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.forwardButton setTitle:@"FORWARD" forState:UIControlStateNormal];
    [self.forwardButton addTarget:self action:@selector(forwardButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.forwardButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.forwardButton];

    [NSLayoutConstraint activateConstraints:@[
        [self.queryTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.queryTextField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-100],
        [self.queryTextField.widthAnchor constraintEqualToConstant:300],

        [self.getButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.getButton.topAnchor constraintEqualToAnchor:self.queryTextField.bottomAnchor constant:20],

        [self.forwardButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.forwardButton.topAnchor constraintEqualToAnchor:self.getButton.bottomAnchor constant:20]
    ]];
}

- (void)getButtonTapped {
    NSLog(@"GET button tapped");
    Loader *loader = [[Loader alloc] init];
    [loader fetchDataWithQuery:self.queryTextField.text completion:^(NSArray *data, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }

        self.data = data;
        NSLog(@"Data received: %@", data);
    }];
}

- (void)forwardButtonTapped {
    NSLog(@"FORWARD button tapped");
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.data = self.data;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
