import SpriteKit
import GameplayKit

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
}
