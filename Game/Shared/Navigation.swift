import UIKit

class Navigation:UINavigationController {
    override var prefersStatusBarHidden:Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated:false)
        setViewControllers([HomeView()], animated:false)
    }
}
