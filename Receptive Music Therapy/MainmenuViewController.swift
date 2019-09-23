//
//  MainmenuViewController.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/22/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class MainmenuViewController: UIViewController {
    
    @IBOutlet weak var animatedBackground: UIView!
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        let path: String = "waterfall"
        let theURL = Bundle.main.url(forResource: "Backgrounds/" + path, withExtension: "mp4")

        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = UIColor.clear;
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        super.viewDidLoad()
        
    }
}
