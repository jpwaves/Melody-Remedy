//
//  TransitionViewController.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/21/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//
import UIKit
import Foundation

class TransitionViewController: UIViewController {
    @IBOutlet weak var textContinue: UILabel!
    
    func fadeIn(finished: Bool) {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: { self.textContinue.alpha = 1.0 } , completion: self.fadeOut)
    }

    func fadeOut(finished: Bool) {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: { self.textContinue.alpha = 0.1 } , completion: self.fadeIn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fadeOut(finished: true)
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        print("screen Tapped")
    }
    
}
