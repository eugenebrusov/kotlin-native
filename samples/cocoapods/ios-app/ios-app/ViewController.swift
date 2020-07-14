import UIKit
import kotlin_library

class ViewController: UIViewController {
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var textLabel: UILabel!
    
    class MyCallback: NetCallback {
        var success: (_ _text: String) -> Void
        
        init(success: @escaping (_ _text: String) -> Void) {
            self.success = success
        }
        
        override func onSuccess(text: String) {
            success(text)
            //indicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }
    
    @IBAction func onGoTouch(_ sender: Any) {
        self.textLabel.isHidden = true
        indicator.startAnimating()
        KotlinLibKt.getAndShow(url: "https://run.mocky.io/v3/93d2dccc-a42a-4f9e-bf22-35489c842b0e", callback: MyCallback(success: { text in
                self.textLabel.isHidden = false
                self.textLabel.text = text
                self.indicator.stopAnimating()
            }))
    }
}

