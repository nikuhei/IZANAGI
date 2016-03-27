//
//  ViewController.swift
//  meログ
//
//  Created by 西澤 郁平 on 2016/03/26.
//  Copyright © 2016年 ikunyan.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greetingText: UITextField!
    @IBOutlet weak var greetingButton: UIButton!

    @IBAction func doGreet(sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        greetingText.text = "こんにちは！"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

