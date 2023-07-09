import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cntTouch: UILabel!
    @IBOutlet weak var touchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cntTouch.textAlignment = .center
        touchButton.layer.cornerRadius = touchButton.frame.size.width / 2
        touchButton.backgroundColor = UIColor.systemGray
    }
    
    private var cnt : Int = 0
    
    @IBAction func buttonDidTap(_ sender: Any) {
        cnt += 1
        var text : String = "Значение счётчика: \(cnt)"
        cntTouch.text = text
    }
    
}

