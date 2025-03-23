import RealityKit
import SwiftUI

public class GizmosEntity: Entity {
    private var axis: Entity

    required init() {
        let axis = Self.createAxisVisualizer()
        self.axis = axis

        super.init()

        addChild(axis)
    }

    private func setupAccessibility() {
        var axComponent = AccessibilityComponent()
        axComponent.isAccessibilityElement = true
        axComponent.label = "Coordinate system axes"
        axComponent.value = "X: red, Y: green, Z: blue"
        components.set(axComponent)
    }

    private static func createAxisVisualizer() -> Entity {
        let container = Entity()

        let size: Float = 0.1
        let xAxis = ModelEntity(mesh: .generateBox(size: [size, 0.01, 0.01]),
                                materials: [SimpleMaterial(color: .red, isMetallic: false)])
        xAxis.position = [size / 2, 0, 0]

        let yAxis = ModelEntity(mesh: .generateBox(size: [0.01, size, 0.01]),
                                materials: [SimpleMaterial(color: .green, isMetallic: false)])
        yAxis.position = [0, size / 2, 0]

        let zAxis = ModelEntity(mesh: .generateBox(size: [0.01, 0.01, size]),
                                materials: [SimpleMaterial(color: .blue, isMetallic: false)])
        zAxis.position = [0, 0, size / 2]

        container.addChild(xAxis)
        container.addChild(yAxis)
        container.addChild(zAxis)

        return container
    }
}
