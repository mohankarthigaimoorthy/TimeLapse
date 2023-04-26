//
//  ViewController.swift
//  fine
//
//  Created by Mohan K on 09/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updateLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var remainingTime: TimeInterval = 0
       var endDate: NSDate!
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        remainingTime = 228.0   // choose as many seconds as you want (total time)
        endDate = NSDate().addingTimeInterval(remainingTime)   // set your future end date by adding the time for your timer

        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateLabel", userInfo: nil, repeats: true) // create a timer to update your label
//        updateLabel()
    }
    
    func updateLabel() {
            timerLabel.text = endDate.timeIntervalSinceNow.mmss
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

}

extension NSTimeInterva {
    var mmss: String {
        return self < 0 ? "00:00" : String(format:"%02d:%02d", Int((self/60.0) % 60), Int(self % 60))
    }
    var hmmss: String {
        return String(format:"%d:%02d:%02d", Int(self/3600.0), Int(self / 60.0 % 60), Int(self % 60))
    }
}
