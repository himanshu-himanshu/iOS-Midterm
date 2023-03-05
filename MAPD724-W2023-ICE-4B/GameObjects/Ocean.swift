import GameplayKit
import SpriteKit

class Ocean : GameObject {
    // constructor / initializer
    init() {
        super.init(imageString: "ocean2", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        zPosition = Layer.ocean.rawValue
        //zRotation = Double.pi / 2
        verticalSpeed = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.x <= -2253) {
            Reset()
        }
    }
    
    override func Reset() {
        position.x = 2253
    }
    
    func Move() {
        position.x -= verticalSpeed!
    }
}
