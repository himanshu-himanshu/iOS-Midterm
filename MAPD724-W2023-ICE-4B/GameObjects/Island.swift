//  File Name: Island

//  Author: Himanshu (301296001)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Midterm Exam

//  Task: Enable Mail Pilot in landscape mode.

//  Date modified: 04/03/2023

import GameplayKit
import SpriteKit

class Island : GameObject {
    // initializer / constructor
    init() {
        super.init(imageString: "island", initialScale: 1.4)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.x <= -876) {
            Reset()
        }
    }
    
    override func Reset() {
        position.x = 876
        
        // get a pseudo random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    // public method
    func Move() {
        position.x -= verticalSpeed!
    }
}
