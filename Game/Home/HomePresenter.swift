import CleanArchitecture

class HomePresenter:Presenter {
    @objc func newGame() {
        Application.navigation.setViewControllers([IntroView()], animated:true)
    }
}
