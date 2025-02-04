#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Loader.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];

    self.getQueryTextField = [[UITextField alloc] init];
    self.getQueryTextField.placeholder = @"GET Request";
    self.getQueryTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.getQueryTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.getQueryTextField];

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

    self.postQueryTextField = [[UITextField alloc] init];
    self.postQueryTextField.placeholder = @"POST Request";
    self.postQueryTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.postQueryTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.postQueryTextField];

    self.postButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.postButton setTitle:@"POST" forState:UIControlStateNormal];
    [self.postButton addTarget:self action:@selector(postButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.postButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.postButton];

    [NSLayoutConstraint activateConstraints:@[
        [self.getQueryTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.getQueryTextField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-150],
        [self.getQueryTextField.widthAnchor constraintEqualToConstant:300],

        [self.getButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.getButton.topAnchor constraintEqualToAnchor:self.getQueryTextField.bottomAnchor constant:20],

        [self.forwardButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.forwardButton.topAnchor constraintEqualToAnchor:self.getButton.bottomAnchor constant:20],

        [self.postQueryTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.postQueryTextField.topAnchor constraintEqualToAnchor:self.forwardButton.bottomAnchor constant:20],
        [self.postQueryTextField.widthAnchor constraintEqualToConstant:300],

        [self.postButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.postButton.topAnchor constraintEqualToAnchor:self.postQueryTextField.bottomAnchor constant:20]
    ]];
}

- (void)getButtonTapped {
    NSLog(@"GET button tapped");
    Loader *loader = [[Loader alloc] init];
    [loader fetchDataWithQuery:self.getQueryTextField.text completion:^(NSArray *data, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }

        self.getData = data;
        NSLog(@"Data received: %@", data);
    }];
}

- (void)forwardButtonTapped {
    NSLog(@"FORWARD button tapped");
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.data = self.getData;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)postButtonTapped {
    NSLog(@"POST button tapped");
    Loader *loader = [[Loader alloc] init];
    [loader sendPostDataWithQuery:self.postQueryTextField.text completion:^(NSArray *data, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }

        self.postData = data;
        NSLog(@"Data received: %@", data);
        ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
        thirdViewController.data = self.postData;
        [self.navigationController pushViewController:thirdViewController animated:YES];
    }];
}

@end
