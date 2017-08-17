//
//  WebViewController.h
//  Gravitas
//
//  Created by Keshav Bansal on 18/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *wv;
}
-(IBAction)back;
@end
