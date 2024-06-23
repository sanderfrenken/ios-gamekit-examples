import SpriteKit
import GameplayKit

final class EntityManager {

    let scene: SKScene
    var entities = Set<GKEntity>()

    lazy var componentSystems: [GKComponentSystem] = {
        return [GKComponentSystem(componentClass: MoveComponent.self),
                GKComponentSystem(componentClass: SpriteComponent.self)]
    }()

    init(scene: SKScene) {
        self.scene = scene
    }

    func add(_ entity: GKEntity) {
        entities.insert(entity)
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }


    func update(_ deltaTime: CFTimeInterval) {
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: deltaTime)
        }
    }
}
