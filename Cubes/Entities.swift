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

    // TEST MAP

    func testMap() {
        walls(p:CGPoint(x: anchorPoint.x,y: anchorPoint.y - 160))
        walls(p:CGPoint(x: anchorPoint.x - 32,y: anchorPoint.y - 160))
        walls(p:CGPoint(x: anchorPoint.x + 32,y: anchorPoint.y - 160))

        walls(p:CGPoint(x: anchorPoint.x,y: anchorPoint.y + 160))
        walls(p:CGPoint(x: anchorPoint.x - 32,y: anchorPoint.y + 160))
        walls(p:CGPoint(x: anchorPoint.x + 32,y: anchorPoint.y + 160))


    }


}
