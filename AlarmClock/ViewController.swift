//
//  ViewController.swift
//  AlarmClock
//
//  Created by 559 on 9/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chageDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        lblPickerTime.text = "선택시간: " + dateFormatter.string(from: datePickerView.date)
        alarmTime = datePickerView.date
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        lblCurrentTime.text = "현재시간: " + dateFormatter.string(from: date as Date)
        if dateFormatter.string(from: date as Date) == dateFormatter.string(from: alarmTime) {
            view.backgroundColor = .red
        } else {
            view.backgroundColor = .white
        }
    }
}
