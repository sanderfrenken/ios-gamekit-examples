import UIKit
import SpriteKit
import GameplayKit
import GameKit
import QuickLook

final class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        guard let skView = self.view as? SKView else {
            fatalError()
        }

        skView.showsFPS = showStatistics
        skView.showsNodeCount = showStatistics
        skView.showsDrawCount = showStatistics
        skView.showsFields = showStatistics
        skView.showsPhysics = showStatistics
        skView.showsQuadCount = showStatistics

        skView.preferredFramesPerSecond = 60
        skView.shouldCullNonVisibleNodes = true
        skView.ignoresSiblingOrder = true
        skView.isMultipleTouchEnabled = false
        skView.presentScene(MenuScene(size: skView.bounds.size))
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.all]
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
