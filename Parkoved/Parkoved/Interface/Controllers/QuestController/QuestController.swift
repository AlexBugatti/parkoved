//
//  QuestController.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import ARKit

class QuestController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sceneView.delegate = self
        self.sceneView.showsStatistics = true
        
        let scene = SCNScene()
        let olafScene = SCNScene.init(named: "box2.dae")
        
        
        
//        let sceneViewTappedOn = gesture.view as! ARSCNView
//        let touchCoordinates = gesture.location(in: sceneView)
//        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates, types: .existingPlaneUsingExtent)
//
//        guard !hitTest.isEmpty, let hitTestResult = hitTest.first else {
//            return
//        }
        
        let position = SCNVector3(1,
                                  1,
                                  1)
        
        guard let olafNode = olafScene?.rootNode.childNode(withName: "box", recursively: true) else {
            return
        }
        
//        olafNode.scale = SCNVector3Make(0.5, 0.5, 0.5)
//        let action = SCNAction.scale(by: sender.scale, duration: 1.0)
//        node.runAction(action)
        
//         if let camera = sceneView.session.currentFrame?.camera {
//          didInitializeScene = true
//          var translation = matrix_identity_float4x4
//          translation.columns.3.z = -1.0
//          let transform = camera.transform * translation
//          let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
////          sceneController.addSphere(position: position)
//        }
        
//        let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)

        olafNode.position = position
        scene.rootNode.addChildNode(olafNode)
        sceneView.scene = scene
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.session.run(configuration)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuestController: ARSCNViewDelegate {
    
}
