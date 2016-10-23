//
// Created by Jalen Moore on 10/19/16.
// Copyright (c) 2016 Jalen Moore. All rights reserved.
//

import Foundation
import SpriteKit

class Entities: SKScene, SKPhysicsContactDelegate {

    // Scene Loader

    func loadScene(scene: SKScene) {
        let gameScene = scene
        let transition = SKTransition.fade(withDuration: 1.0)
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(gameScene, transition: transition)

    }

    // Player

    let player = SKSpriteNode(imageNamed: "Cube.png")
    func playProp() {
        player.position = CGPoint(x: anchorPoint.x, y: anchorPoint.y + 32)
        player.size = CGSize(width: 32, height: 32)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        if let p = player.physicsBody {
            p.allowsRotation = false
            p.isDynamic = true
            p.affectedByGravity = true

        }

        addChild(player)

    }

    // Walls

    func walls(p: CGPoint) {
        let w = SKSpriteNode(imageNamed: "Cube 2.png")
        w.position = p
        w.size = CGSize(width: 32, height: 32)
        w.physicsBody = SKPhysicsBody(rectangleOf: w.size)
        if let h = w.physicsBody {
            h.allowsRotation = false
            h.isDynamic = false
            h.affectedByGravity = false
        }

        addChild(w)

    }

    /*  let jump = [SKAction.runBlock {
            if physicsWorld.gravity == CGVector(dx: 10,dy: -90) {
                physicsWorld.gravity = CGVector(dx: 10,dy: 90)
            }
            if physicsWorld.gravity == CGVector(dx: -10,dy: -90) {

            }
        }]
        let fall = [SKAction.runBlock {
            if physicsWorld.gravity = CGVector(dx: -10,dy: 0) {

            }
        }]
    */

    // Player Jumping Actions, Note: Enemies will not be effected by gravity, they'll use a different movement system.

    func jump() -> SKAction {
        return SKAction.run({
            if self.physicsWorld.gravity == CGVector(dx: 10,dy: -90) {
                self.physicsWorld.gravity = CGVector(dx: 10,dy: 90)
            }
            if self.physicsWorld.gravity == CGVector(dx: -10,dy: -90) {
                self.physicsWorld.gravity = CGVector(dx: -10,dy: 90)
            }
            if self.physicsWorld.gravity == CGVector(dx: 0, dy: -90) {
                self.physicsWorld.gravity = CGVector(dx: 0,dy: 90)
            }
        })
    }

    func fall() -> SKAction {
        return SKAction.run({
            if self.physicsWorld.gravity == CGVector(dx: 10,dy: 90) {
                self.physicsWorld.gravity = CGVector(dx: 10,dy: -90)
            }
            if self.physicsWorld.gravity == CGVector(dx: -10,dy: 90) {
                self.physicsWorld.gravity = CGVector(dx: -10,dy: -90)
            }
            if self.physicsWorld.gravity == CGVector(dx: 0, dy: 90) {
                self.physicsWorld.gravity = CGVector(dx: 0,dy: -90)
            }
        })


    }

    // TEST MAP

    func testMap() {
        var point = anchorPoint
        var point2 = anchorPoint

        var p = 0
        var p2 = 0

        while p <= 15 {walls(p: point); point = CGPoint(x: point.x + 32, y: point.y); p = p + 1}
        while p2 <= 15 {walls(p: point2); point2 = CGPoint(x: point2.x - 32, y: point2.y); p2 = p2 + 1}

    }


}
