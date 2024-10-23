import SpriteKit
import GameplayKit

@MainActor
final class SpriteComponent: GKComponent {

    let node: SKSpriteNode
    private(set) var shouldContinueActions = true

    init(color: SKColor, size: CGSize) {
        node = SKSpriteNode(color: color, size: size)
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func update(deltaTime seconds: TimeInterval) {
        let nodeToUse = node
        Task {
            let size = await nodeToUse.size
            print("size: \(size)")
        }
    }
}
