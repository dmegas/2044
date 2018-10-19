import CleanArchitecture

class IntroView:View<IntroPresenter> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeOutlets()
    }
    
    private func makeOutlets() {
    }
}
