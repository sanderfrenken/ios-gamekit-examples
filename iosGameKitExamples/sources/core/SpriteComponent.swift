import SpriteKit
import GameplayKit

final class SpriteComponent: GKComponent {

    let node: SKSpriteNode
    private(set) var shouldContinueActions = true

    override init() {
        node = SKSpriteNode(color: .red, size: .init(width: 5, height: 5))
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
