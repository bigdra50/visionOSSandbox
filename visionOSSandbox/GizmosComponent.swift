import RealityKit
import SwiftUI

public struct GizmosComponent: Component {
    var axisLength: Float = 0.1
    var axisThickness: Float = 0.005
    var isVisible: Bool = true

    var xAxisColor: UIColor = .red
    var yAxisColor: UIColor = .green
    var zAxisColor: UIColor = .blue

    init(
        axisLength: Float = 0.1,
        axisThickness: Float = 0.005,
        isVisible: Bool = true
    ) {
        self.axisLength = axisLength
        self.axisThickness = axisThickness
        self.isVisible = isVisible
    }
}
