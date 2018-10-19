import UIKit
import NotificationCenter

@objc(WidgetView) class WidgetView:UIViewController, NCWidgetProviding {
    private weak var effect:UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let effect:UIVisualEffectView
        if #available(iOSApplicationExtension 10.0, *) {
            effect = UIVisualEffectView(effect:UIVibrancyEffect.widgetPrimary())
        } else {
            effect = UIVisualEffectView(effect:UIVibrancyEffect.notificationCenter())
        }
        effect.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(effect)
        self.effect = effect
    }
    
    func widgetPerformUpdate(completionHandler:(@escaping(NCUpdateResult) -> Void)) {
        completionHandler(.newData)
    }
}
