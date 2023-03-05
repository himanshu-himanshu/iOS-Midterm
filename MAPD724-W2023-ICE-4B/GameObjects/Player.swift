import GameplayKit
import SpriteKit

class Player : GameObject {
    // Initializer
    init() {
        super.init(imageString: "player2", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start() {
        zPosition = Layer.plane.rawValue
        //zRotation = Double.pi / -2
        Reset()
    }
    
    override func Update() {
        CheckBounds()
    }
    
    override func CheckBounds() {
        // Check for top boundry
        if(position.y <= -140) {
            position.y = -140
        }
        
        // Check for bottom boundry
        if(position.y >= 140) {
            position.y = 140
        }
    }
    
    override func Reset() {
        position.x = -320
    }
    
    func TouchMove(newPos: CGPoint) {
        position = newPos
    }
    
}
