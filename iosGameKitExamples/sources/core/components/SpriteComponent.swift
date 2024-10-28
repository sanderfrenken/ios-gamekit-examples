import SpriteKit
import GameplayKit

@MainActor
final class SpriteComponent: GKComponent, @unchecked Sendable {

    let node: SKSpriteNode
    private(set) var shouldContinueActions = true

    init(color: SKColor, size: CGSize) {
        node = SKSpriteNode(color: color, size: size)
        super.init()
    }

    override func didAddToEntity() {
        // For demonstration purposes on how to work with SCC in Swift 6 together with GameplayKit and SpriteKit.
        // With SpriteKit we should be able to safely assume we are running on the MainActor, hence this call to `didAddToEntity` also happens on the MainActor
        // We therefore can put the below call to the node variable inside an `assumeIsolated` block on the MainActor
        // Note that in order to send our SpriteComponent over to the MainActor, we need to mark it as Sendable
        // As we we usually have some state in our components, we opt for an @unchecked Sendable.
        MainActor.assumeIsolated {
            print(node.size)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
