import CleanArchitecture
import AVFoundation

class IntroView:View<IntroPresenter> {
    private weak var layer:AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 10.0, *) {
            try! AVAudioSession.sharedInstance().setCategory(.playback, mode:.moviePlayback)
        }

        view.backgroundColor = .black
        makeOutlets()
        
        NotificationCenter.default.addObserver(self, selector:#selector(introEnded), name:Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        layer.player?.play()
    }
    
    private func makeOutlets() {
        let player = AVPlayer(url:Bundle.main.url(forResource:"intro", withExtension:"mp4")!)
        let layer = AVPlayerLayer(player:player)
        layer.frame = UIScreen.main.bounds
        view.layer.addSublayer(layer)
        self.layer = layer
    }
    
    @objc private func introEnded() {
        Application.navigation.setViewControllers([HomeView()], animated:true)
    }
}
