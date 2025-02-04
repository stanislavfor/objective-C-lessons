#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];

    self.resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetTapped) forControlEvents:UIControlEventTouchUpInside];
    self.resetButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.resetButton];

    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.backButton setTitle:@"BACK TO" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backTapped) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.backButton];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];

    [NSLayoutConstraint activateConstraints:@[
        [self.resetButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.resetButton.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],

        [self.backButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.backButton.topAnchor constraintEqualToAnchor:self.resetButton.bottomAnchor constant:20],

        [self.tableView.topAnchor constraintEqualToAnchor:self.backButton.bottomAnchor constant:20],
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (void)resetTapped {
    NSLog(@"Reset button tapped");
    self.data = nil;
    [self.tableView reloadData];
}

- (void)backTapped {
    NSLog(@"Back button tapped");
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    NSDictionary *item = self.data[indexPath.row];
    cell.textLabel.text = [item objectForKey:@"url"];
    cell.detailTextLabel.text = [[item objectForKey:@"headers"] description];

    return cell;
}

@end
