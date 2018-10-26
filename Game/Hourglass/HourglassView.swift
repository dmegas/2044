import CleanArchitecture
import SpriteKit

class HourglassView:View<HourglassPresenter>, SKSceneDelegate, SKPhysicsContactDelegate {
    private weak var skView:SKView!
    private weak var scene:SKScene!
    private weak var glass:SKSpriteNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeOutlets()
    }
    
    private func makeOutlets() {
        let skView = SKView()
        skView.isUserInteractionEnabled = false
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        skView.translatesAutoresizingMaskIntoConstraints = false
        skView.showsPhysics = false
        view.addSubview(skView)
        self.skView = skView
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = -1
        slider.maximumValue = 1
        slider.addTarget(self, action:#selector(rotate(slider:)), for:.valueChanged)
        view.addSubview(slider)
        
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
        self.glass = glass
        
        skView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        
        slider.leftAnchor.constraint(equalTo:view.leftAnchor, constant:50).isActive = true
        slider.rightAnchor.constraint(equalTo:view.rightAnchor, constant:-50).isActive = true
        slider.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant:-50).isActive = true
        
        addSand()
    }
    
    private func addSand() {
        let sand = SKSpriteNode(texture:nil, color:.white, size:CGSize(width:4, height:4))
        sand.position = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
        sand.physicsBody = SKPhysicsBody(edgeLoopFrom:CGRect(x:-2, y:-2, width:4, height:4))
        sand.physicsBody!.isDynamic = true
        sand.physicsBody!.friction = 0
        sand.physicsBody!.allowsRotation = true
        sand.physicsBody!.restitution = 1
        sand.physicsBody!.density = 100
        sand.physicsBody!.velocity = CGVector(dx:0, dy:-10)
        scene.addChild(sand)
    }
    
    @objc private func rotate(slider:UISlider) {
        glass.zRotation = .pi * CGFloat(slider.value)
    }
}
