//
//  ViewController.swift
//  图层拼接渐变线
//
//  Created by Xinxibin on 16/8/8.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gmView: GMView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gmView.strokeEndFloat = 1
        
    }
    @IBAction func changeSlider(sender: UISlider) {
        gmView.strokeEndFloat = CGFloat(sender.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

