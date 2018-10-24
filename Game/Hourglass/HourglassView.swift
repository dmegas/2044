import CleanArchitecture
import SpriteKit

class HourglassView:View<HourglassPresenter> {
    private weak var skView:SKView!
    private weak var scene:SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeOutlets()
    }
    
    private func makeOutlets() {
        let skView = SKView()
        view.addSubview(skView)
        self.skView = skView
        
        let scene = SKScene(size:UIScreen.main.bounds.size)
        skView.presentScene(scene)
        self.scene = scene
    }
}
