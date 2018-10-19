import CleanArchitecture

class HomeView:View<HomePresenter> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeOutlets()
    }
    
    private func makeOutlets() {
        let newGame = UIButton()
        newGame.translatesAutoresizingMaskIntoConstraints = false
        newGame.setTitle(.local("HomeView.newGame"), for:[])
        newGame.setTitleColor(.white, for:[])
        newGame.addTarget(presenter, action:#selector(presenter.newGame), for:.touchUpInside)
        view.addSubview(newGame)
        
        newGame.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        newGame.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant:-100).isActive = true
        newGame.widthAnchor.constraint(equalToConstant:200).isActive = true
        newGame.heightAnchor.constraint(equalToConstant:50).isActive = true
    }
}
