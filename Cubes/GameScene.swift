//
//  GameScene.swift
//  Cubes
//
//  Created by Jalen Moore on 10/19/16.
//  Copyright © 2016 Jalen Moore. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: Entities {

    func swipedRight(sender:UISwipeGestureRecognizer){
        print("Swiped Right")
        physicsWorld.gravity = CGVector(dx: 90,dy: 0)
    }

    func swipedLeft(sender:UISwipeGestureRecognizer){
        print("Swiped Left")
        physicsWorld.gravity = CGVector(dx: -90,dy: 0)
    }

    func swipedDown(sender:UISwipeGestureRecognizer){
        print("Swiped Down")
        physicsWorld.gravity = CGVector(dx: 0,dy: -90)
    }

    func swipedUp(sender:UISwipeGestureRecognizer){
        print("Swiped Up")
        physicsWorld.gravity = CGVector(dx: 0,dy: 90)
    }


    override func didMove(to view: SKView) {
        backgroundColor = UIKit.UIColor.red
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0,dy: -90)

        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)


        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)


        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)


        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)

        playProp()
        testMap()
        self.camera = cam
    }

    let cam = SKCameraNode()
    var location = CGPoint(x: 0,y: 0)

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
