Description
=======
<p>DataDownloader is an iOS class created to make managing multiple NSURLConnections easier by encapsulating the NSURLConnection and delegate responses and by handling the responses with blocks.</p>

Sample
=======
```
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:<URL STRING>]];
    	[request setHTTPShouldUsePipelining:YES];
    
	DataDownloader* dDownloader = [[DataDownloader alloc] init];
	[dDownloader fetchDataWithRequest:request completionHandler:^(NSData* data, NSError* error){
        	if(error != nil){
			//Handle Error
			return;
		}
		
		//No error, process data
	}];
```

License
=======
```
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

```


	