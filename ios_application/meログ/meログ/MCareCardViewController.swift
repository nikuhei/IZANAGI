//
//  MCareCardViewController.swift
//  meログ
//
//  Created by 西澤 郁平 on 2016/05/03.
//  Copyright © 2016年 ikunyan.org. All rights reserved.
//

import UIKit
import CareKit

class MCareCardViewController: OCKCareCardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let careCardPlanStore = self.store
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
