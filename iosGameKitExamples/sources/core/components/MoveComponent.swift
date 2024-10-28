import GameplayKit
import SpriteKit

@MainActor
final class MoveComponent: GKAgent2D, @preconcurrency GKAgentDelegate {

    override init() {
        super.init()
        self.maxSpeed = 100
        self.maxAcceleration = 10
        self.radius = 25
        self.mass = 0.1
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }

    func agentWillUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        guard let agent2d = agent as? GKAgent2D else {
            return
        }
        agent2d.rotation = Float(spriteComponent.node.zRotation)
        agent2d.position = .init(spriteComponent.node.position)
    }

    func agentDidUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
            return
        }
        if position.y.isNaN || position.x.isNaN {
            return
        }
        guard let agent2d = agent as? GKAgent2D else {
            return
        }
        spriteComponent.node.position = .init(position)
        spriteComponent.node.zRotation = CGFloat(agent2d.rotation)
    }
}
