import CleanArchitecture

class HomePresenter:Presenter {
    @objc func newGame() {
        Application.navigation.setViewControllers([HourglassView()], animated:true)
    }
}
