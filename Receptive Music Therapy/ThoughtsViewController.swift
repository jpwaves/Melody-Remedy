//
//  File.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/22/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import Foundation
import UIKit

class ThoughtsViewController: UIViewController {
    
    @IBOutlet weak var GradientBackground: UIView!
    var enableButton = false


    @IBOutlet weak var thoughtsTextbox: UITextField!

    func textfieldFilled() {
        print("X")
        if thoughtsTextbox.text != "" {
            enableButton = true
        } else {
            enableButton = false
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        textfieldFilled()
        if enableButton {
            performSegue(withIdentifier: "TransitionToContinueDecision", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer();
        layer.frame = GradientBackground.bounds;
        layer.colors = [UIColor.green.cgColor, UIColor.cyan.cgColor];
        layer.startPoint = CGPoint(x: 0, y: 0);
        layer.endPoint = CGPoint(x: 1, y: 1);
        GradientBackground.layer.addSublayer(layer);
    }
}
