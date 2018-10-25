import CleanArchitecture
import SpriteKit

class HourglassView:View<HourglassPresenter>, SKSceneDelegate, SKPhysicsContactDelegate {
    private weak var skView:SKView!
    private weak var scene:SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeOutlets()
    }
    
    private func makeOutlets() {
        let skView = SKView()
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        skView.translatesAutoresizingMaskIntoConstraints = false
        skView.showsPhysics = false
        view.addSubview(skView)
        self.skView = skView
        
        let scene = SKScene(size:UIScreen.main.bounds.size)
        scene.backgroundColor = .clear
        scene.scaleMode = .resizeFill
        scene.delegate = self
        scene.physicsWorld.contactDelegate = self
        skView.presentScene(scene)
        self.scene = scene
    }
}
