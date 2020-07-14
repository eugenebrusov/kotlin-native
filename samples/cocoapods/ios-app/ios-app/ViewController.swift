import UIKit
import kotlin_library

class ViewController: UIViewController {

    class MyCallback: NetCallback {
        override func onSuccess(text: String) {
            NSLog(text)
        }
    }
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }
    
    @IBAction func onGoTouch(_ sender: Any) {
        let url = urlField.text!
        KotlinLibKt.getAndShow(url: "https://run.mocky.io/v3/93d2dccc-a42a-4f9e-bf22-35489c842b0e", callback: MyCallback())
        //contentTextView.text = KotlinLibKt.generateTestString()
        //KotlinLibKt.getAndShow(url: url, contentView: contentTextView)
    }
}

