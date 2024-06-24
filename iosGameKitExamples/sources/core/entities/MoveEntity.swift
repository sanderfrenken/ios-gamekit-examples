import GameplayKit

final class MoveEntity: GKEntity {

    init(color: SKColor, size: CGSize) {
        super.init()
        addComponent(SpriteComponent(color: color, size: size))
        addComponent(MoveComponent())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
