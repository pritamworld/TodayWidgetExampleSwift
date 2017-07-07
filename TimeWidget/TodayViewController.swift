//
//  TodayViewController.swift
//  TimeWidget
//
//  Created by Pritesh Patel on 2017-07-07.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet var pacificLabel: UILabel!
    @IBOutlet var mountainLabel: UILabel!
    @IBOutlet var centralLabel: UILabel!
    @IBOutlet var easternLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        //self.preferredContentSize = CGSizeMake(320, 50);
        self.updateClocks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func updateClocks() {
        let time: NSDate = NSDate()
        print("Time: \(time)")
        
        let timeString : NSString = "Time: \(time)" as NSString
        
        let formatter:DateFormatter = DateFormatter();
        var timeZone = NSTimeZone(name: "UTC")
        formatter.timeZone = timeZone as TimeZone!
        formatter.dateFormat = "HH:mm"
        print("UTC Time: \(formatter.string(from: time as Date))")
        
        timeZone = NSTimeZone(name: "US/Eastern")
        formatter.timeZone = timeZone as TimeZone!
        formatter.dateFormat = "HH:mm"
        print("EST Time: \(formatter.string(from: time as Date))")
        easternLabel.text = formatter.string(from: time as Date)
        
        timeZone = NSTimeZone(name: "US/Pacific")
        formatter.timeZone = timeZone as TimeZone!
        formatter.dateFormat = "HH:mm"
        print("PST Time: \(formatter.string(from: time as Date))")
        pacificLabel.text = formatter.string(from: time as Date)
        
        timeZone = NSTimeZone(name: "US/Mountain")
        formatter.timeZone = timeZone as TimeZone!
        formatter.dateFormat = "HH:mm"
        print("MT Time: \(formatter.string(from: time as Date))")
        mountainLabel.text = formatter.string(from: time as Date)
        
        timeZone = NSTimeZone(name: "US/Central")
        formatter.timeZone = timeZone as TimeZone!
        formatter.dateFormat = "HH:mm"
        centralLabel.text = formatter.string(from: time as Date)
    }
    
}
