//  File Name: GameViewController

//  Author: Himanshu (301296001)
//  Subject: MAPD724 Advanced iOS Development
//  Assignment: Midterm Exam

//  Task: Enable Mail Pilot in landscape mode.

//  Date modified: 04/03/2023

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    // UI Connections below
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene() // Present start scene when the game starts
        
        CollisionManager.gameViewController = self
    }

    /** Changes the Orientation to landscape mode */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape // Enable landscape mode
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Function for updating Lives Label
    func updateLivesLabel() {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    // Function for updating Score Label
    func updateScoreLabel() {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    // Function for setting Scenes
    func setScene(sceneName: String) -> Void {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    // Function for presenting StartScene
    func presentStartScene() {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    // Function for presenting EndScene
    func presentEndScene() {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    // Runs the function when Start button is pressed
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    // Runs the function when Restart button is pressed
    @IBAction func RestartButton_Pressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
    }
}
