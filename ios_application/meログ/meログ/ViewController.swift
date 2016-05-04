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

