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
        
        let path = UIBezierPath()
        path.move(to:CGPoint(x:28, y:0))
        path.addLine(to:CGPoint(x:123, y:148))
        path.addLine(to:CGPoint(x:-123, y:148))
        path.addLine(to:CGPoint(x:-28, y:0))
        path.addLine(to:CGPoint(x:-123, y:-148))
        path.addLine(to:CGPoint(x:123, y:-148))
        
        let glass = SKSpriteNode(texture:SKTexture(image:#imageLiteral(resourceName: "hourglass.pdf")), color:.clear, size:CGSize(width:250, height:300))
        glass.position = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
        glass.physicsBody = SKPhysicsBody(edgeLoopFrom:path.cgPath)
        scene.addChild(glass)
        
        skView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    }
}
