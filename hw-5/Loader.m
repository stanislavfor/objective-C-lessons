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

- (void)sendPostDataWithQuery:(NSString *)query completion:(void (^)(NSArray *data, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:@"https://postman-echo.com/post"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [query dataUsingEncoding:NSUTF8StringEncoding];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
