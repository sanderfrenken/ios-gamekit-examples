import CoreGraphics
import simd

extension CGPoint {
    init(_ point: vector_float2) {
        self.init(x: CGFloat(point.x), y: CGFloat(point.y))
    }
}

extension vector_float2 {
    init(_ point: CGPoint) {
        self.init(x: Float(point.x), y: Float(point.y))
    }
}
