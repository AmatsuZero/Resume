//
//  ViewController.swift
//  ResumeDisplay
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Cocoa
import DJResumeTemplate

class ViewController: NSViewController {

    let template = try? DJResumeTemplate(basePath: "https://eyrefree.github.io/EFResume")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Fill Content
    }
}

