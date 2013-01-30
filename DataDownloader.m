//
//  DataDownloader.m
//
//  Copyright (c) 2012 Patrick Pierson
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "DataDownloader.h"

@interface DataDownloader () {
    NSURLConnection* dataConnection;
    NSMutableData* responseData;
    void (^completionBlock)(NSData*, NSError*);
    BOOL isRunning;
}

@end

@implementation DataDownloader

- (id)init{
    if(self = [super init]){
        responseData = [[NSMutableData alloc] init];
        isRunning = NO;
    }
    return self;
}

- (void)fetchDataWithRequest:(NSURLRequest*)request completionHandler:(void (^)(NSData*, NSError*))completion{
    [responseData setLength:0];
    completionBlock = completion;
    dataConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [dataConnection start];
    isRunning = YES;
}

- (void)cancelConnection{
    if(dataConnection) {
        [dataConnection cancel];
        isRunning = NO;
    }
}

- (BOOL)isRunning{
    return isRunning;
}

#pragma mark - NSURLConnection Delegate Methods
- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)aResponse {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)error {
	completionBlock(nil, error);
    isRunning = NO;
    dataConnection = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    completionBlock(responseData, nil);
    isRunning = NO;
    dataConnection = nil;
}
