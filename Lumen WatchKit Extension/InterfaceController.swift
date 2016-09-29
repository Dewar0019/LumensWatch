//
//  InterfaceController.swift
//  Lumen WatchKit Extension
//
//  Created by Dewar Tan on 9/26/16.
//  Copyright © 2016 Dewar Tan. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

enum Result<T, E: Error> {
    case Success(T)
    case Failure(E)
    
    init(value: T) {
        self = .Success(value)
    }
    
    init(error: E) {
        self = .Failure(error)
    }
}

class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var interfaceImage: WKInterfaceImage!;
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("In awake");
        self.interfaceImage.setImageNamed("lumen");
        self.interfaceImage.startAnimatingWithImages(in: NSMakeRange(1, 15), duration: 1.0, repeatCount: 0);
        
        
        performAndRetryRequestWithURL(url: "https://httpbin.org/get") { value in
            self.interfaceImage.stopAnimating();
            print("Hello")
            WKInterfaceController.reloadRootControllers(withNames: ["MainScreen"], contexts: nil);
        }
    }
    
    
    func performAndRetryRequestWithURL(url: String, completionHandler:@escaping (AnyObject?) -> Void) {
        Alamofire.request(url).responseJSON{ response in
            switch response.result {
            case .success(let value):
                completionHandler(value as AnyObject?);
            case .failure(let error):
                print(error)
                let deadlineTime = DispatchTime.now() + .seconds(5)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    print("retrying");
                    self.performAndRetryRequestWithURL(url: url, completionHandler: completionHandler)
                }
            }
        }
    }
    
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
