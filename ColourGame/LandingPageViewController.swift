//
//  LandingPageViewController.swift
//  ColourGame
//
//  Created by Olgu on 02/03/16.
//  Copyright © 2016 Olgu Sirman. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareButton(sender: UIButton) {
    
        /*
        NSString *url=@"http://itunes.apple.com/us/app/APPNAME/idXXXXXXXXX";
        NSString * title =[NSString stringWithFormat:@"Download ECG app %@ and get free reward points!",url];
        NSArray* dataToShare = @[title];
        UIActivityViewController* activityViewController =[[UIActivityViewController alloc] initWithActivityItems:dataToShare applicationActivities:nil];
        activityViewController.excludedActivityTypes = @[UIActivityTypeAirDrop];
        [self presentViewController:activityViewController animated:YES completion:^{}];
        */
        
        let string: String = ""
        let URL: NSURL = NSURL(string: string)!
        
        let activityViewController = UIActivityViewController(activityItems: [string, URL], applicationActivities: nil)
        navigationController?.presentViewController(activityViewController, animated: true) {
            // ...
        }
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        
    
    }
    
}
