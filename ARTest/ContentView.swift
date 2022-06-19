//
//  ContentView.swift
//  ARTest
//
//  Created by JU88 on 2022/4/14.
//

import SwiftUI
import RealityKit
import ARKit
import Combine
 
let boxAnchor  = try! Experience.loadBoard()

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame:.zero )
        
        // Load the "Box" scene from the "Experience" Reality File
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config, options: [])
        
        arView.scene.anchors.append(boxAnchor)
        
        
        // Add the box anchor to the scene
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
