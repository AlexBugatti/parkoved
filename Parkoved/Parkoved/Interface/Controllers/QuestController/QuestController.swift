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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sceneView.delegate = self
        self.sceneView.showsStatistics = true
        
        let scene = SCNScene()
        let olafScene = SCNScene.init(named: "cnek.obj")
        
        
//        let sceneViewTappedOn = gesture.view as! ARSCNView
//        let touchCoordinates = gesture.location(in: sceneView)
//        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates, types: .existingPlaneUsingExtent)
//
//        guard !hitTest.isEmpty, let hitTestResult = hitTest.first else {
//            return
//        }
        
        let position = SCNVector3(2,
                                  3,
                                  5)
        
        guard let olafNode = olafScene?.rootNode.childNode(withName: "Overhead_Softbox_2_Softbox_Texture", recursively: true) else {
            return
        }
        
        olafNode.position = position
        scene.rootNode.addChildNode(olafNode)
        sceneView.scene = scene
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
