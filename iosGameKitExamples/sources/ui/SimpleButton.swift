import SpriteKit

private enum MSKButtonState {
    case normal
    case selected
}

open class SimpleButton: SKSpriteNode {

    public var onTouchesBegan: (() -> Void)?

    public init(size: CGSize,
                color: SKColor,
                text: String) {
        super.init(texture: nil, color: color, size: size)
        isUserInteractionEnabled = true
        let label = SKLabelNode(text: text)
        label.fontSize = 24
        label.fontColor = .black
        label.position.y -= 6
        addChild(label)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        (onTouchesBegan ?? {})()
    }

    public func clearReferences() {
        onTouchesBegan = nil
    }
}
