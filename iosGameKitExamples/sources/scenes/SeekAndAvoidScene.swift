import SpriteKit
import GameplayKit

class SeekAndAvoidScene: SKScene {

    var lastUpdateTime: TimeInterval = 0
    var entityManager: EntityManager?
    let moveEntity = MoveEntity(color: .green, size: .init(width: 10, height: 10))

    private var obstacles = [GKPolygonObstacle]()

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = sceneBackgroundColor
        anchorPoint = sceneAnchorPoint
        physicsWorld.gravity = .zero

        addBackButton()
        entityManager = EntityManager(scene: self)
        addMoveEntity()
        addObstacles()
    }

    private func addObstacles() {
        let positions: [CGPoint] = [
            .init(x: -100, y: 100),
            .init(x: -300, y: -40),
            .init(x: 200, y: -100)
        ]
        let nodes: [SKSpriteNode] = positions.map { position in
            let node = SKSpriteNode(color: .red, size: .init(width: 60, height: 60))
            node.zPosition = 3
            node.position = position
            addChild(node)
            return node
        }
        obstacles = SKNode.obstacles(fromNodeBounds: nodes)
    }

    private func addMoveEntity() {
        if let spriteComponent = moveEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .zero
            spriteComponent.node.zPosition = 4
        }
        entityManager?.add(moveEntity)
    }

    private func seekAndAvoidToPosition(_ position: CGPoint?) {
        guard let moveComponent = moveEntity.component(ofType: MoveComponent.self), let position else {
            return
        }
        addTouchIndicatorNode(position)
        moveComponent.seekToLocationWhileAvoiding(location: position, obstacles: obstacles)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        seekAndAvoidToPosition(getPositionFromTouches(touches))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        seekAndAvoidToPosition(getPositionFromTouches(touches))
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
