import SpriteKit

class SeekScene: SKScene {

    var lastUpdateTime: TimeInterval = 0
    var entityManager: EntityManager?
    let moveEntity = MoveEntity(color: .green, size: .init(width: 10, height: 10))

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = sceneBackgroundColor
        anchorPoint = sceneAnchorPoint
        physicsWorld.gravity = .zero

        addBackButton()
        entityManager = EntityManager(scene: self)
        addMoveEntity()
    }

    private func addMoveEntity() {
        if let spriteComponent = moveEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .zero
            spriteComponent.node.zPosition = 4
        }
        entityManager?.add(moveEntity)
    }

    private func seekToPosition(_ position: CGPoint?) {
        guard let moveComponent = moveEntity.component(ofType: MoveComponent.self), let position else {
            return
        }
        addTouchIndicatorNode(position)
        moveComponent.seekToLocation(position)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        seekToPosition(getPositionFromTouches(touches))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        seekToPosition(getPositionFromTouches(touches))
    }

    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        entityManager?.update(delta)
    }
}
