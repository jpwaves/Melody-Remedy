//
//  receptive.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/21/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ReceptiveViewController: UIViewController {

    @IBOutlet weak var gradientBackground: UIView!
    
    override func viewDidLoad() {
        let layer = CAGradientLayer();
        layer.frame = gradientBackground.bounds;
        layer.colors = [UIColor.yellow.cgColor, UIColor.green.cgColor];
        layer.startPoint = CGPoint(x: 0, y: 0);
        layer.endPoint = CGPoint(x: 1, y: 1);
        gradientBackground.layer.addSublayer(layer);

        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            //view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }

    @IBAction func testButton(_ sender: Any) {
        print("Button pressed")
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
