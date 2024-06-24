import SpriteKit

extension CGPoint {
    init(_ point: vector_float2) {
        self.init(x: CGFloat(point.x), y: CGFloat(point.y))
    }
}

extension vector_float2 {
    init(_ point: CGPoint) {
        self.init(x: Float(point.x), y: Float(point.y))
    }
}

extension SKScene {
    func addBackButton() {
        let backButton = SimpleButton(size: buttonSize,
                                      color: buttonColor,
                                      text: "Back")
        backButton.zPosition = 2
        backButton.position.x = -frame.width/2+backButton.frame.width/2
        backButton.position.y = frame.height/2-backButton.frame.height/2
        addChild(backButton)
        backButton.onTouchesBegan = {
            self.view?.presentScene(MenuScene(size: self.size), transition: .crossFade(withDuration: 1))
        }
    }

    func getPositionFromTouches(_ touches: Set<UITouch>) -> CGPoint? {
        guard let touch = touches.first else {
          return nil
        }
        return touch.location(in: self)
    }

    func addTouchIndicatorNode(_ position: CGPoint) {
        childNode(withName: "indicatorNode")?.removeFromParent()
        let indicatorNode = SKShapeNode(circleOfRadius: 20)
        indicatorNode.strokeColor = .green
        indicatorNode.lineWidth = 2
        indicatorNode.fillColor = .clear
        indicatorNode.zPosition = 4
        indicatorNode.name = "indicatorNode"
        indicatorNode.position = position
        addChild(indicatorNode)
    }
}
