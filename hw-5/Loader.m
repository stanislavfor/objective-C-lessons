#import "Loader.h"

@implementation Loader

- (void)fetchDataWithQuery:(NSString *)query completion:(void (^)(NSArray *data, NSError *error))completion {
    NSString *urlString = [NSString stringWithFormat:@"https://postman-echo.com/get?%@", query];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completion(nil, jsonError);
            return;
        }

        NSLog(@"Response: %@", json);
        NSArray *dataArray = @[json];
        completion(dataArray, nil);
    }];
    [dataTask resume];
}

@end
