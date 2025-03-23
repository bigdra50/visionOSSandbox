//
//  ImmersiveView.swift
//  visionOSSandbox
//
//  Created by Ryudai Kimura on 2025/03/23.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(
                named: "Immersive", in: realityKitContentBundle
            ) {
                content.add(immersiveContentEntity)
            }

            // 座標系の原点を表示したいエンティティを作成
            let rootEntity = Entity()
            rootEntity.addGizmos()

            // 子エンティティに座標系を表示
            let childEntity = Entity()
            childEntity.position = [0.2, 0.3, -0.5]
            childEntity.addGizmos()

            // 回転した座標系にもGizmosを追加
            let rotatedEntity = Entity()
            rotatedEntity.position = [-0.2, 0.1, -0.3]
            rotatedEntity.orientation = simd_quatf(angle: .pi / 4, axis: [1, 1, 0])
            rotatedEntity.addGizmos()

            // エンティティを追加
            rootEntity.addChild(childEntity)
            rootEntity.addChild(rotatedEntity)
            content.add(rootEntity)
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
