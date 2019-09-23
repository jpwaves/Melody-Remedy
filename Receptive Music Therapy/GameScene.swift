//
//  GameScene.swift
//  testProject
//
//  Created by James Yaguma on 9/21/19.
//  Copyright © 2019 Ejiskwrosmew. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation
import AVKit
import MediaPlayer

var bpm = 90
var beatsPassed = 0.00
var songTimer = 0
var currentNoteCount = 0
var notesDone = 0
var notesPassed = 0
var waitOnStart = 5.0
var startWait = waitOnStart
var regTap = false
var totalHits = 0

class GameScene: SKScene {
    
    private var spinnyNode : SKShapeNode?
    private var track1 = SKSpriteNode(imageNamed: "track1")
    private var judgementLine = SKSpriteNode(imageNamed: "judgementLine")
    private var note = SKSpriteNode(imageNamed: "normalNote")
    private var audio = Bundle.main.path(forResource: "Sounds/beautiful-acoustic-guitar-music-calm-soft-ambient-relaxing-meditation-soothing-spa-yoga", ofType: "mp3")
    
    
    var notes = [Double]()
    var noteSprites = [SKSpriteNode]()
    override func didMove(to view: SKView) {
        notes = [0.0, 1.0, 1.5, 2.0, 2.5, 3.0, 10.0 / 3.0, 11.0 / 3.0, 4.0, 5.0]
        self.backgroundColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:1.0)
        
        self.track1.size = CGSize(width:119, height: 1704)
        self.addChild(self.track1)
        self.judgementLine.size = CGSize(width: 149, height: 47)
        self.judgementLine.position = CGPoint(x: 0, y: -521)
        self.judgementLine.zPosition = 0
        self.addChild(self.judgementLine)
        self.note.size = CGSize(width: 131, height: 29)
        
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.group([SKAction.fadeOut(withDuration: 0.5), SKAction.scale(to: 3, duration: 0.5)]),
                                                             SKAction.removeFromParent()]))
        }
    }
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = CGPoint(x: 0, y: -521)
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
    
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        regTap = true
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if gameviewLoaded {
            // Called before each frame is rendered
            for sprite in noteSprites {
                sprite.position.y -= 7.09375
                if (sprite.position.y <= -734) {
                    sprite.removeFromParent()
                }
                if (round(sprite.position.y) == -521) {
                    print("Hit")
                }
            }
            if startWait > 0 {
                songTimer += 1
                startWait = waitOnStart - Double(songTimer) / Double(3600 / bpm)
                if (startWait == 0) {
                    songTimer = 0
    //                do {
    //                    let audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
    //                    print("Successful play")
    //                    audioPlayer.volume = 1.1
    //                    audioPlayer.play()
    //                    print("playing")
    //                    print("END")
    //                    print("final END")
    //                } catch {
    //                    print(error)
    //                }
                }
                if (notes.count > notesDone) {
                    print(Double(0 - startWait), notes[notesDone] - 4)
                    if Double(0 - startWait) >= notes[notesDone] - 4 {
                        self.noteSprites.append(self.note.copy() as! SKSpriteNode)
                        self.noteSprites[currentNoteCount].position = CGPoint(x: 0, y: 621)
                        self.noteSprites[currentNoteCount].zPosition = 2
                        self.addChild(noteSprites[currentNoteCount])
                        currentNoteCount += 1
                        notesDone += 1
                    }
                }
            } else {
                if songTimer % (3600 / bpm) == 0 {
                    print("Beat Passed", beatsPassed, songTimer)
                }
                songTimer += 1
                beatsPassed = Double(songTimer) / Double(3600 / bpm)
                if notes.count > notesPassed {
                    if beatsPassed > notes[notesPassed] + (2 / Double(3600 / bpm)){
                        notesPassed += 1
                        print("Note Missed", beatsPassed, notes[notesPassed - 1], 2.0 / Double(3600/bpm))
                    }
                }
                if notes.count > notesDone {
                    print(beatsPassed, notes[notesDone])
                    if beatsPassed >= notes[notesDone] - 4 {
                        self.noteSprites.append(self.note.copy() as! SKSpriteNode)
                        self.noteSprites[currentNoteCount].position = CGPoint(x: 0, y: 621)
                        self.noteSprites[currentNoteCount].zPosition = 2
                        self.addChild(noteSprites[currentNoteCount])
                        currentNoteCount += 1
                        notesDone += 1
                    }
                }
            }
            if notes.count > notesPassed {
                if notes[notesPassed] <= beatsPassed + (2.0 / Double(3600/bpm)) && notes[notesPassed] >=  beatsPassed - (2.0 / Double(3600/bpm)) && regTap {
                    totalHits += 1
                    noteSprites[notesPassed].removeFromParent()
                    notesPassed += 1
                    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
                        n.position = CGPoint(x: 0, y: -521)
                        n.strokeColor = UIColor(red:0.5, green:1.00, blue:0.5, alpha:1.0)
                        self.addChild(n)
                    }
                    print("Hit Note", beatsPassed, notes[notesPassed - 1], 2.0 / Double(3600/bpm))
                }
            }
            regTap = false
        }
    }
}
