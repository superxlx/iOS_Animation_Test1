//
//  thirdViewController.swift
//  iOS_Animation_Test1
//
//  Created by xlx on 15/4/25.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit
import QuartzCore

enum AnimationDirection: Int {
    case Positive = 1
    case Negative = -1
}
class thirdViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repeat1()
        // Do any additional setup after loading the view.
    }
    func repeat1(){
        delay(seconds: 1){
        self.cubeTransition(label: self.label1, text: "SuperXlx", direction: AnimationDirection.Positive)
            self.fadeImageView(self.bgImage,
                toImage: UIImage(named: "bg-sunny")!)
            self.repeat2()
        }
    }
    func repeat2(){
        delay(seconds: 1){
            self.fadeImageView(self.bgImage,
                toImage: UIImage(named: "bg-snowy")!)
     self.cubeTransition(label: self.label1, text: "StrongX", direction: AnimationDirection.Negative)
            self.repeat1()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fadeImageView(imageView: UIImageView, toImage: UIImage) {
        
        UIView.transitionWithView(imageView, duration: 1.0,
            options: .TransitionCrossDissolve, animations: {
                imageView.image = toImage
            }, completion: nil)
        
    }

    func cubeTransition(#label: UILabel, text: String, direction: AnimationDirection) {
        
        let auxLabel = UILabel(frame: label.frame)
        auxLabel.text = text
        auxLabel.font = label.font
        auxLabel.textAlignment = label.textAlignment
        auxLabel.textColor = label.textColor
      //  auxLabel.backgroundColor = label.backgroundColor
        
        let auxLabelOffset = CGFloat(direction.rawValue) *
            label.frame.size.height/2.0
        
        auxLabel.transform = CGAffineTransformConcat(
            CGAffineTransformMakeScale(1.0, 0.1),
            CGAffineTransformMakeTranslation(0.0, auxLabelOffset))
        
        label.superview!.addSubview(auxLabel)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
            auxLabel.transform = CGAffineTransformIdentity
            label.transform = CGAffineTransformConcat(
                CGAffineTransformMakeScale(1.0, 0.1),
                CGAffineTransformMakeTranslation(0.0, -auxLabelOffset))
            }, completion: {_ in
                label.text = auxLabel.text
                label.transform = CGAffineTransformIdentity
                
                auxLabel.removeFromSuperview()
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
