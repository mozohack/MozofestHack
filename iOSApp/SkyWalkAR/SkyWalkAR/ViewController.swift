//
//  ViewController.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 30/03/19.
//  Copyright © 2019 Ayush Verma. All rights reserved.
//

import UIKit
import SceneKit
import Firebase
import ARKit

class ViewController: UIViewController,ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var button: customButton!
    @IBOutlet weak var xcor: UILabel!
    @IBOutlet weak var ycor: UILabel!
    @IBOutlet weak var zcor: UILabel!
    
    
    var buttonHighlighted = false
    var lineColor = UIColor.white
    var previousPoint: SCNVector3?
    
    //static reference point for calc.
    var pulsarX = -0.3
    var pulsarY = -0.3
    var pulsarZ = -0.3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
  
        //change the positions to a much better location in this room for pitching.
        let position1 = SCNVector3(0,0,-0.58)
        let position2 = SCNVector3(-1.27,-0,1.08)
        let position3 = SCNVector3(1.18,0,-1.5)
        let position4 = SCNVector3(-5.32,0,-2.28)
        let position5 = SCNVector3(8.12,0,-3.50)
        let position6 = SCNVector3(-30.22,0,-5.30)
        let position7 = SCNVector3(10.42,0,-7.77)
        let position8 = SCNVector3(-20.50,0,-11.09)
        let position9 = SCNVector3(x: -0.3, y: -0.3, z: -0.3)
        
        
        //give a position to the node
        let mercury = planet1(at: position1)
        let venus = planet2(at: position2)
        let earth = planet3(at: position3)
        let mars = planet4(at: position4)
        let jupiter = planet5(at: position5)
        let saturn = planet6(at: position6)
        let uranus = planet7(at: position7)
        let neptune = planet8(at: position8)
        let pulsar = Pulsar(at: position9)
        
        
        //adding the as the child in the node
        scene.rootNode.addChildNode(mercury)
        scene.rootNode.addChildNode(venus)
        scene.rootNode.addChildNode(earth)
        scene.rootNode.addChildNode(mars)
        scene.rootNode.addChildNode(jupiter)
        scene.rootNode.addChildNode(saturn)
        scene.rootNode.addChildNode(uranus)
        scene.rootNode.addChildNode(neptune)
        scene.rootNode.addChildNode(pulsar)
        
        
        //random stars.
        // stars are not created properly create more stars in other locations.
        for _ in 1...250{
            
            let lowerValue = -15
            let upperValue = 5
            let Zlower = -5
            let Zupper = 2
            let result = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) +   lowerValue
            let Zresult = Int(arc4random_uniform(UInt32(Zupper - Zlower + 1))) +   Zlower
            let position10 = SCNVector3(Float(result),-(Float(CGFloat(arc4random()%20))),Float(Zresult))
            let star = Stars(at: position10)
            scene.rootNode.addChildNode(star)
        }
        
        //tracking the location and printing
        let currentCameraPosition:SCNVector3 = (sceneView.pointOfView?.position)!
        print(currentCameraPosition)
        
    }
    
    func Stars(at position:SCNVector3) -> SCNNode{
        let random = SCNSphere(radius: 0.03)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 224.0, green: 224.0, blue: 224.0, alpha: 1.0)
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 1 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    
    //try creating a function rather than all the diff planets.
    func planet1(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.11)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"mercury")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        
        let action = SCNAction.rotate(by: 60 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        
        return designNode
    }
    
    func planet2(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.18)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"venus")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        
        let action = SCNAction.rotate(by: 160 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet3(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"earth")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 250 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet4(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.106)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"mars")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 360 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet5(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 1.1)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"jupiter")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 170 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet6(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 1.5)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"saturn")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 40 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet7(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.796)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"uranus")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 30 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet8(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.773)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"neptune")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 25 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    
    //the main STAR.
    func Pulsar(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.03)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 224.0, green: 224.0, blue: 224.0, alpha: 1.0)
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 1 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)  
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
