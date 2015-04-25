//
//  secondViewController.swift
//  iOS_Animation_Test1
//
//  Created by xlx on 15/4/25.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit


func delay(#seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}
class secondViewController: UIViewController {

    
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
    var statusPosition = CGPoint.zeroPoint
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        status.hidden = true
        status.center = CGPoint(x: 160, y: 300)
        view.addSubview(status)
        
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .Center
        status.addSubview(label)
        
        statusPosition = status.center

        delay(seconds: 1.0) {
            self.showMessage(index: 0)
        }

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showMessage(#index: Int) {
        label.text = messages[index]
        
        UIView.transitionWithView(status, duration: 0.33, options:
            .CurveEaseOut | .TransitionCurlDown, animations: {
                self.status.hidden = false
            }, completion: {_ in
                //transition completion
                delay(seconds: 2.0) {
                    if index < self.messages.count-1 {
                        self.removeMessage(index: index)
                    } else {
                        //reset form
                    }
                }
        })
    }
    
    func removeMessage(#index: Int) {
        UIView.animateWithDuration(0.33, delay: 0.0, options: nil, animations: {
            self.status.center.x += self.view.frame.size.width
            }, completion: {_ in
                self.status.hidden = true
                self.status.center = self.statusPosition
                
                self.showMessage(index: index+1)
        })
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
