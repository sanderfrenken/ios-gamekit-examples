import SpriteKit
import GameplayKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = sceneBackgroundColor
        anchorPoint = sceneAnchorPoint

        let goToSeekSceneButton = SimpleButton(size: buttonSize,
                                               color: buttonColor,
                                               text: "Seeking")
        goToSeekSceneButton.zPosition = 2
        addChild(goToSeekSceneButton)
        goToSeekSceneButton.onTouchesBegan = {
            self.view?.presentScene(SeekingScene(size: self.size))
        }
    }
}
