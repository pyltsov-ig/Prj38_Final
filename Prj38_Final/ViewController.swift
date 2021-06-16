//
//  ViewController.swift
//  Prj38_Final
//
//  Created by ИГОРЬ on 16/06/2021.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var secondStepper: UIStepper!
    @IBOutlet weak var intervalIndicator: UILabel!
    
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in }
        center.delegate = self
    }

    @IBAction func secondStepperValueChanged(_ sender: Any) {
        
        intervalIndicator.text = String(Int(secondStepper.value))
        
    }
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "ПРИВЕТ !!!!"
        content.body = "ТАСС УПОЛНОМОЧЕН ЗАЯВИТЬ..."
        
        let interval = Double(intervalIndicator.text ?? "0") ?? 0
    
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in }
        
        
    }
    
}

