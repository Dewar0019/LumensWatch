//
//  Connected.swift
//  Lumen
//
//  Created by Dewar Tan on 9/28/16.
//  Copyright © 2016 Dewar Tan. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON


class MainScreen :WKInterfaceController {
    
    @IBOutlet var connectedText: WKInterfaceLabel!
    @IBOutlet var response: WKInterfaceButton!
    var connected = false;
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let status =  context as? String;
        print(GlobalVariables.piURL);
        connectedText.setText(status);
        if(status == "Not Connected") {
            print(status);
            self.connected = false;
            response.setTitle("TryAgain");
        } else if(status == "Connected") {
            print(status);
            self.connected = true;
            response.setTitle("Say Hi");
            
        }
    }
    
    
    @IBAction func responseButtonClick() {
        if(connected) {
            let message: Parameters = [
                "message": "Hello"
            ]
            
            Alamofire.request(GlobalVariables.piURL, method: .post, parameters: message, encoding: JSONEncoding.default).responseJSON{ response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value);
                    print("success");
                    
                case .failure(let error):
                    print(error)
                }
            }
            
                
            } else {
                print("trying again, going back to LoadScreen");
                WKInterfaceController.reloadRootControllers(withNames: ["LoadScreen"], contexts: nil);
            }
        }
        
        
        
        override func willActivate() {
            super.willActivate()
        }
        
        override func didDeactivate() {
            super.didDeactivate()
        }
}
