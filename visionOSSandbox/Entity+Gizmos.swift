import RealityKit

extension Entity {
    func addGizmos(
        length: Float = 0.1,
        thickness: Float = 0.005,
        isVisible: Bool = true
    ) {
        let gizmosComponent = GizmosComponent(
            axisLength: length,
            axisThickness: thickness,
            isVisible: isVisible
        )
        components.set(gizmosComponent)
    }

    func removeGizmos() {
        components.remove(GizmosComponent.self)
    }

    var gizmosComponent: GizmosComponent? {
        get { components[GizmosComponent.self] }
        set { components[GizmosComponent.self] = newValue }
    }
}
