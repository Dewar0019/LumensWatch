//
//  Connected.swift
//  Lumen
//
//  Created by Dewar Tan on 9/28/16.
//  Copyright © 2016 Dewar Tan. All rights reserved.
//

import WatchKit
import Foundation


class MainScreen :WKInterfaceController {
    
    @IBOutlet var connectedText: WKInterfaceLabel!
    @IBOutlet var tryAgain: WKInterfaceButton!
   
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let status =  context as? String
        connectedText.setText(status);
        if(status == "Not Connected") {
            tryAgain.setHidden(false);
        }
    }
    
    
    @IBAction func tryAgainButtonClick() {
        print("trying again, going back to LoadScreen");
                WKInterfaceController.reloadRootControllers(withNames: ["LoadScreen"], contexts: nil);

    }

    

    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
