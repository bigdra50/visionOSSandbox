import RealityKit

struct GizmosSystem: System {
    static let query = EntityQuery(where: .has(GizmosComponent.self))

    static var gizmosCache: [Entity: GizmosEntity] = [:]

    init(scene _: RealityKit.Scene) {}

    func update(context: SceneUpdateContext) {
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            guard let gizmosComponent: GizmosComponent = entity.components[GizmosComponent.self]
            else { continue }

            if Self.gizmosCache[entity] == nil {
                let gizmosEntity = GizmosEntity()
                entity.addChild(gizmosEntity)
                Self.gizmosCache[entity] = gizmosEntity
            }

            if let gizmosEntity = Self.gizmosCache[entity] {
                gizmosEntity.isEnabled = gizmosComponent.isVisible
            }
        }
    }
}
