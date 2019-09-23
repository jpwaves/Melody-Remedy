//
//  GradientView.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/21/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    private var gradient: CAGradientLayer?
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
