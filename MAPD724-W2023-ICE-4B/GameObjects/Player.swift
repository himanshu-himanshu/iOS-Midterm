import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        zRotation = Double.pi / -2
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.y <= -270)
        {
            position.y = -270
        }
        
        // constrain the player on the right boundary
        if(position.y >= 270)
        {
            position.y = 270
        }
    }
    
    override func Reset()
    {
        position.x = -330
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
