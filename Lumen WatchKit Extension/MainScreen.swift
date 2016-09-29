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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        connectedText.setText("Connected");
        
    }
    

    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
