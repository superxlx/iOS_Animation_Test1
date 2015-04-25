//
//  ViewController.swift
//  iOS_Animation_Test1
//
//  Created by xlx on 15/4/24.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationView3: UIView!
    @IBOutlet weak var animationView2: UIView!
    @IBOutlet weak var animationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.animationView2.alpha = 0
        self.animationView3.alpha = 0
        UIView.animateWithDuration(5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .Repeat, animations: { () -> Void in
            self.animationView.center.y += 100
        }) { (Bool) -> Void in
            println("finish")
        }
        UIView.animateWithDuration(5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .Repeat, animations: { () -> Void in
            self.animationView2.alpha = 1
            }) { (Bool) -> Void in
                println("finish")
        }
        UIView.animateWithDuration(5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .Repeat, animations: { () -> Void in
            self.animationView3.center.y -= 100
            self.animationView3.alpha = 1
            }) { (Bool) -> Void in
                println("finish")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

