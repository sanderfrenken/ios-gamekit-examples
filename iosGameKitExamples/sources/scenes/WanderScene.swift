import SpriteKit
import GameplayKit

class WanderScene: SKScene {

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
        if let spriteComponent = moveEntity.component(ofType: SpriteComponent.self),
           let moveComponent = moveEntity.component(ofType: MoveComponent.self) {
            spriteComponent.node.position = .zero
            moveComponent.wander(obstacles: addWalls())
        }
        entityManager?.add(moveEntity)
    }

    private func addWalls() -> [GKObstacle] {
        let leftBoundary = SKSpriteNode(color: .red, size: .init(width: 50, height: frame.height))
        let rightBoundary = SKSpriteNode(color: .red, size: .init(width: 50, height: frame.height))
        let upperBoundary = SKSpriteNode(color: .red, size: .init(width: frame.width, height: 50))
        let lowerBoundary = SKSpriteNode(color: .red, size: .init(width: frame.width, height: 50))

        leftBoundary.position.x = -frame.width/2
        rightBoundary.position.x = frame.width/2
        upperBoundary.position.y = frame.height/2
        lowerBoundary.position.y = -frame.height/2

        let nodes = [leftBoundary, rightBoundary, upperBoundary, lowerBoundary]

        nodes.forEach { node in
            node.zPosition = 3
            addChild(node)
        }
        return SKNode.obstacles(fromNodeBounds: nodes)
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
