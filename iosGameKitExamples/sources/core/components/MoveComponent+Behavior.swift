import GameplayKit

extension MoveComponent {
    func wander(obstacles: [GKObstacle]) {
        behavior = GKBehavior(goals: [.init(toWander: 20), .init(toAvoid: obstacles, maxPredictionTime: 20)], andWeights: [0.1, 1000])
    }

    func seekToLocation(_ location: CGPoint) {
        // Create a dummy agent at the desired location for seeking
        let agent = GKAgent2D()
        agent.position = .init(location)

        behavior = GKBehavior(goal: .init(toSeekAgent: agent), weight: 1)
    }

    func seekToLocationWhileAvoiding(location: CGPoint, obstacles: [GKObstacle]) {
        // Create a dummy agent at the desired location for seeking
        let agent = GKAgent2D()
        agent.position = .init(location)

        behavior = GKBehavior(goals: [.init(toSeekAgent: agent), .init(toAvoid: obstacles, maxPredictionTime: 20)], andWeights: [0.1, 1000])
    }
}
