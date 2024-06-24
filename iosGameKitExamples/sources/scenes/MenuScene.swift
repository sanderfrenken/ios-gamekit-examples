import SpriteKit
import GameplayKit

class MenuScene: SKScene {

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = sceneBackgroundColor
        anchorPoint = sceneAnchorPoint

        let seekSceneButton = addButton(position: .init(x: 0, y: frame.height/2-buttonSize.height/2), text: "Seek")
        seekSceneButton.onTouchesBegan = {
            self.view?.presentScene(SeekScene(size: self.size), transition: .crossFade(withDuration: 1))
        }

        let seekAndAvoidSceneButton = addButton(position: .init(x: 0, y: frame.height/2-2*buttonSize.height), text: "Seek + Avoid")
        seekAndAvoidSceneButton.onTouchesBegan = {
            self.view?.presentScene(SeekAndAvoidScene(size: self.size), transition: .crossFade(withDuration: 1))
        }

        let wanderSceneButton = addButton(position: .init(x: 0, y: frame.height/2-3.5*buttonSize.height), text: "Wander")
        wanderSceneButton.onTouchesBegan = {
            self.view?.presentScene(WanderScene(size: self.size), transition: .crossFade(withDuration: 1))
        }
    }

    private func addButton(position: CGPoint, text: String) -> SimpleButton {
        let button = SimpleButton(size: buttonSize, color: buttonColor, text: text)
        button.position = position
        button.zPosition = 2
        addChild(button)
        return button
    }
}
