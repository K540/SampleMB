//
//  ViewController.swift
//  SampleMB
//
//  Created by KSF on 2016/10/11.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unownedToTop(_ segue: UIStoryboardSegue) {}
    
    @IBAction func ButtonTouchUpInside(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "tel://117")!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

