//
//  ViewController.swift
//  meログ
//
//  Created by 西澤 郁平 on 2016/03/26.
//  Copyright © 2016年 ikunyan.org. All rights reserved.
//

import UIKit
import CareKit

class ViewController: UIViewController {
    @IBOutlet weak var greetingText: UITextField!
    @IBOutlet weak var greetingButton: UIButton!

    let storeManager = BaseCarePlanStoreManager.sharedCarePlanStoreManager
    
    let greetingMessage = "こんにちは！"
    let careCardPlanStore = "MeLogCareStore"
    var careCardViewController: OCKCareCardViewController?

    @IBAction func doGreet(sender: UIButton) {
        let store = storeManager.getCarePlanStore()

        let startDate = NSDateComponents(year: 2016, month: 5, day: 1)
        let onceADay = OCKCareSchedule.dailyScheduleWithStartDate(startDate, occurrencesPerDay: 1)
        
        let medication = OCKCarePlanActivity(identifier: storeManager.getMedicationIdentifier(), groupIdentifier: nil, type: .Intervention, title: "体温測定", text: "℃", tintColor: nil, instructions: "毎日起床時に測定して下さい。", imageURL: nil, schedule: onceADay, resultResettable: true, userInfo: nil)
        let activity = OCKCarePlanActivity(identifier: "MeLogActivityStore", groupIdentifier: nil, type: .Intervention, title: "運動記録", text: "歩", tintColor: nil, instructions: "毎日就寝前に記録して下さい。", imageURL: nil, schedule: onceADay, resultResettable: true, userInfo: nil)

        store.addActivity(medication)  { success, error in
            if !success {
                print(error?.localizedDescription)
            }
        }
        store.addActivity(activity)  { success, error in
            if !success {
                print(error?.localizedDescription)
            }
        }

        careCardViewController = MCareCardViewController(carePlanStore: store)
        self.navigationController?.pushViewController(careCardViewController!, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        greetingText.text = greetingMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

