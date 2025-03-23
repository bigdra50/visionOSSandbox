//
//  visionOSSandboxApp.swift
//  visionOSSandbox
//
//  Created by Ryudai Kimura on 2025/03/23.
//

import SwiftUI

@main
struct VisionOSSandboxApp: App {
    @State private var appModel = AppModel()

    init() {
        registerGizmosSystem()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}

func registerGizmosSystem() {
    GizmosComponent.registerComponent()
    GizmosSystem.registerSystem()
}
