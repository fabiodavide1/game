//
//  ViewController.swift
//  Game
//
//  Created by Fabio Davide on 05/06/17.
//  Copyright © 2017 Fabio Davide. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, SKPhysicsContactDelegate {
    @IBOutlet weak var skView: SKView!

    @IBAction func UP(_ sender: Any) {
        
        let sopra = SKAction.applyImpulse(CGVector(dx: 0, dy: 30), duration: 1)
        palla.run(sopra)
        
    }
    let palla = SKShapeNode(circleOfRadius: 20)
    let rettangolo = SKShapeNode(rectOf: CGSize(width: 100, height: 30))
    let rettangolo1 = SKShapeNode(rectOf: CGSize(width: 320, height: 5))
    let corpoRettangolo1 = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 5))

    let corpoPalla = SKPhysicsBody(circleOfRadius: 20)
    let corpoRettangolo = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 30))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //dichiaro scena
        let scena = SKScene(size: skView.frame.size)
        skView.presentScene(scena)
        
        //dicharo velocità scena
        scena.physicsWorld.speed = 1/3
        
        //dicharo collisioni
        scena.physicsWorld.contactDelegate = self
        scena.physicsBody = SKPhysicsBody(edgeLoopFrom: scena.frame)
        palla.physicsBody = corpoPalla
            palla.fillColor = .red
            palla.name = "Palla"
            palla.position = CGPoint(x: scena.frame.midX, y: scena.frame.midY)
        scena.addChild(palla)
        
        
        
        rettangolo.physicsBody = corpoRettangolo
            rettangolo.fillColor = .yellow
            rettangolo.position = CGPoint(x: scena.frame.midX, y: 5 )
        scena.addChild(rettangolo)
        corpoRettangolo.isDynamic = false
        
        rettangolo1.physicsBody = corpoRettangolo1
        rettangolo1.fillColor = .white
        rettangolo1.position = CGPoint(x: scena.frame.midX, y: 568 )
        scena.addChild(rettangolo1)
        corpoRettangolo1.isDynamic = false
        
        let destra = SKAction.moveBy(x: 100, y: 0, duration: 2)
        let sinistra = SKAction.moveBy(x: -200, y: 0, duration: 2)
        let sequenza = SKAction.sequence([destra, sinistra])
        rettangolo.run(sequenza)
        
        
        
        
    
    }

    override func didReceiveMemoryWarning() {
        
        
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
        
        
    }


}

