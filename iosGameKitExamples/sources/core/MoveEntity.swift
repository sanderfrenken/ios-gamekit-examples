import GameplayKit

final class MoveEntity: GKEntity {

    override init() {
        super.init()
        addComponent(SpriteComponent())
        addComponent(MoveComponent())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
