//
//  GameViewController.swift
//  testProject
//
//  Created by James Yaguma on 9/21/19.
//  Copyright © 2019 Ejiskwrosmew. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var gameviewLoaded = false

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gameviewLoaded = true
        print(view)
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                print("scene loaded")
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    @IBAction func backToMenu(_ sender: Any) {
        gameviewLoaded = false
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
