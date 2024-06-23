import SpriteKit

class SeekingScene: SKScene {

    var lastUpdateTime: TimeInterval = 0
    var entityManager: EntityManager?

    let moveEntity = MoveEntity()

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = sceneBackgroundColor
        anchorPoint = sceneAnchorPoint
        physicsWorld.gravity = .zero

        entityManager = EntityManager(scene: self)

        if let spriteComponent = moveEntity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = .zero
        }
        entityManager?.add(moveEntity)
    }

    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        entityManager?.update(delta)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
          return
        }
        let touchPosition = touch.location(in: self)
        if let moveComponent = moveEntity.component(ofType: MoveComponent.self) {
            moveComponent.seekToLocation(touchPosition)
        }
    }
}
