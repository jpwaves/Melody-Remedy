//
//  decisionViewController.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/22/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import Foundation
import UIKit

class DecisionViewController: UIViewController {
    
    @IBOutlet weak var GradientBackground: UIView!
    
    override func viewDidLoad() {
        let layer = CAGradientLayer();
        layer.frame = GradientBackground.bounds;
        layer.colors = [UIColor.magenta.cgColor, UIColor.red.cgColor];
        layer.startPoint = CGPoint(x: 0, y: 0);
        layer.endPoint = CGPoint(x: 1, y: 1);
    GradientBackground.layer.addSublayer(layer);
        super.viewDidLoad()
    }
}
