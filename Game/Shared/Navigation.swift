import UIKit

class Navigation:UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated:false)
        setViewControllers([HomeView()], animated:false)
    }
}
