//
//  ViewController.swift
//  MenuController
//
//  Created by Eran Guttentag on 03/07/2018.
//  Copyright © 2018 Gutte. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet private weak var menuController: GUMenuController!
    @IBOutlet private weak var controllerConstraint: NSLayoutConstraint!
    @IBOutlet private weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let data = [
//            MenuItem("Title 1", subtitle: "Subtitle", image: #imageLiteral(resourceName: "yiftah")),
//            MenuItem("Title 2", subtitle: "Subtitle", image: #imageLiteral(resourceName: "board")),
            MenuItem("Title 1", subtitle: "Subtitle", image: #imageLiteral(resourceName: "pin")),
            MenuItem("Title 2", subtitle: "Subtitle", image: #imageLiteral(resourceName: "pin")),
            MenuItem("Title 3", subtitle: "Subtitle", image: nil),
            MenuItem("Title 4", subtitle: "Subtitle", image: #imageLiteral(resourceName: "pin")),
            MenuItem("Title 5", subtitle: "Subtitle", image: nil)
            ]
        
        self.menuController.items = data
        let configuration = ARWorldTrackingConfiguration()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

