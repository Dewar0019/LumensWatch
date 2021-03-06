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



struct GlobalVariables {
    static var piURL = "http://129.64.188.69:8080/";
}

class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var interfaceImage: WKInterfaceImage!;


    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("Awake");
        //Starting Animation
        self.interfaceImage.setImageNamed("lumen");
        self.interfaceImage.startAnimatingWithImages(in: NSMakeRange(1, 15), duration: 1.0, repeatCount: 0);
        
        performAndRetryRequestWithURL(url: "http://129.64.188.69:8080/") { value in
            print("sucessful connection");
            self.interfaceImage.stopAnimating();
            WKInterfaceController.reloadRootControllers(withNames: ["MainScreen"], contexts: ["Connected"]);
        }
    }
    
    
    func performAndRetryRequestWithURL(url: String, completionHandler:@escaping (AnyObject?) -> Void) {
        Alamofire.request(url).responseJSON{ response in
            switch response.result {
            case .success(let value):
                let json = JSON(value);
//                let name = json["MAC"].stringValue;
//                if(name == "EC:AD:B8:0A:BB:AD") {
                    completionHandler(value as AnyObject?);
//                }
                print("Not currently set on server");
            case .failure(let error):
                print(error)
                let deadlineTime = DispatchTime.now() + .seconds(5)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    self.interfaceImage.stopAnimating();
                    print("Connection failed");
                    WKInterfaceController.reloadRootControllers(withNames: ["MainScreen"], contexts: ["Not Connected"]);
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
