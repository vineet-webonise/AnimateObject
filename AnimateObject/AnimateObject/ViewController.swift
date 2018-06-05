//
//  ViewController.swift
//  AnimateObject
//
//  Created by admin on 05/06/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewSample: UIView!
    
    let square = UIView(
        frame: CGRect(x: 100.0, y: 150.0, width: 150.0, height: 150.0)
    )
    
    let appleImage = UIImageView(
        frame: CGRect(x: 160.0, y: 20.0, width: 200.0, height: 200.0)
    )
    
    let circle = UIView(
        frame: CGRect(x: 0.0, y: 0.0, width: 64.0, height: 64.0)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewImageCreation()
    }
    func viewImageCreation() {
        appleImage.image = UIImage(named: "apple.jpg")
        self.view.addSubview(appleImage)
        circle.center = self.view.center
        circle.backgroundColor = UIColor.blue
        circle.layer.borderColor = UIColor.red.cgColor
        circle.layer.cornerRadius = 32.0
        circle.layer.borderWidth = 2.0
        self.view.addSubview(circle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animate1Tapped(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        self.view.addSubview(square)
        UIView.animate(withDuration: 1, animations:{
            self.square.backgroundColor = .brown
        }, completion:nil)
    }
    
    @IBAction func animate2Tapped(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        self.view.addSubview(square)
        UIView.animate(withDuration: 1, animations: {
            self.square.frame.size.width += 10
            self.square.frame.size.height += 10
        }, completion:nil)
    }
    
    @IBAction func animate3Tapped(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        self.view.addSubview(square)
        UIView.animate(withDuration: 1, animations: {
            self.square.frame.origin.y -= 20
        }, completion:nil)
    }
    
    @IBAction func animateRepeatTapped(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        self.view.addSubview(square)
        UIView.animate(withDuration: 1, delay:0.25, animations: {
            self.square.backgroundColor = .brown
            self.square.frame.size.width += 10
            self.square.frame.size.height += 10
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                    self.square.frame.origin.y -= 20
            })
        }
    }
    
    @IBAction func transformAnimateTapped(_ sender: Any) {
        self.view.layer.removeAllAnimations()
        UIView.animate(withDuration: 2.0, animations: { () -> Void in
            self.circle.backgroundColor = UIColor.white
            self.appleImage.center = self.view.center
        })
        
        let translate = CGAffineTransform(translationX: 100, y: 100)
        let rotate = CGAffineTransform(rotationAngle: 360)
        circle.transform = translate.concatenating(rotate)
    }
    
}

