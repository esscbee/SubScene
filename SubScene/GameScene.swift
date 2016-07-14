//
//  GameScene.swift
//  SubScene
//
//  Created by Stephen Brennan on 7/14/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bodiesToAdd = [ SKNode ] ()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)

            let path = NSBundle.mainBundle().pathForResource("AScene", ofType: "sks")
            let node = SKReferenceNode (URL: NSURL (fileURLWithPath: path!))
            node.position = location
            addChild(node)
        }
    }
    
    override func didSimulatePhysics() {
        for n in bodiesToAdd {
            addChild(n)
        }
        bodiesToAdd.removeAll()
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
