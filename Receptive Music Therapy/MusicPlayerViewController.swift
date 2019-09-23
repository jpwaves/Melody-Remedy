//
//  musicPlayerViewController.swift
//  Receptive Music Therapy
//
//  Created by Justin Pong on 9/21/19.
//  Copyright © 2019 Justin Pong. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import MediaPlayer
import AVKit

//var theBool: ((Bool) -> Void)? = nil


let pathes = ["sunset_clouds", "waterfall", "taiwan", "creek", "northern_lights"]
let pathIndex: Int = Int.random(in: 0 ..< pathes.count)
let path = pathes[pathIndex]

class MusicPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    @IBOutlet weak var blurredBackground: UIView!
    
    var audioPlayer = AVAudioPlayer();
    
    var transitioned = false

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if player.isPlaying != flag {
            print("player stopped")
            transitioned = true
            performSegue(withIdentifier: "abc", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        
        let theURL = Bundle.main.url(forResource: "Backgrounds/" + path, withExtension: "mp4")

        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = UIColor.clear;
        view.layer.insertSublayer(avPlayerLayer, at: 0)

        //NotificationCenter.default.addObserver(self, selector:  Selector(("playerItemDidReachEnd:")), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
        
        blurredBackground.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurredBackground.insertSubview(blurView, at: 0)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            var mp3Path: String = "Positive"
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: "../Users/jp/Library/Autosave Information/Receptive Music Therapy/Receptive Music Therapy/Sounds")
                print(files)
                let mp3Index: Int = Int.random(in: 0 ..< files.count)
                mp3Path = files[mp3Index]
                let substringIndex = mp3Path.lastIndex(of: ".") ?? mp3Path.endIndex
                mp3Path = String(mp3Path[..<substringIndex])
                print(mp3Path)
            } catch {
                print(error)
            }
            
            let sound = Bundle.main.path(forResource: "Sounds/" + mp3Path, ofType: "mp3")
            print("sound path successfuL")
            
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                print("Successful play")
                self.audioPlayer.volume = 1.1
                self.audioPlayer.play()
                print("playing")
                while self.audioPlayer.isPlaying {
                    self.audioPlayerDidFinishPlaying(self.audioPlayer, successfully: true)
                }
                print("END")
                if !self.transitioned {
                    print("transitioning")
                    self.performSegue(withIdentifier: "abc", sender: nil)
                    print("backup transition")
                }
                print("final END")
            } catch {
                print(error)
            }
        }
        NSLayoutConstraint.activate([
        blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
        blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
//    func playerItemDidReachEnd(notification: NSNotification) {
//        print("pPPPPP")
//        let p: AVPlayerItem = notification.object as! AVPlayerItem
//        print("AAaaaaaaaAAAA")
//        p.seek(to: CMTime.zero, completionHandler: theBool)
//        print("Ffsfff")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        avPlayer.play()
//        paused = false
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        avPlayer.pause()
//        paused = true
//    }
    
}
