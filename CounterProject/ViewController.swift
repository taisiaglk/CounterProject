import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cntTouch: UILabel!
    
   
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var restarButton: UIButton!
    
    @IBOutlet weak var allAct: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cntTouch.textAlignment = .center
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = .blue
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = .red
        allAct.text = "История изменений:\n"
        allAct.isEditable = false
        restarButton.setTitle("Сброс", for: .normal)
    }
    
    private var cnt : Int = 0
    
    
    @IBAction func minusButtonTap(_ sender: Any) {
        if cnt > 0 {
            cnt -= 1
            let text : String = "Значение счётчика: \(cnt)"
            cntTouch.text = text
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let formattedDate = formatter.string(from: date)

            let newHistoryItem = "[\(formattedDate)]: значение изменено на -1\n"
            allAct.text.append(newHistoryItem)
            let range = NSRange(location: allAct.text.count - 1, length: 1)
            allAct.scrollRangeToVisible(range)

        } else {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let formattedDate = formatter.string(from: date)

            let newHistoryItem = "[\(formattedDate)]: попытка уменьшить значение счётчика ниже 0\n"
            allAct.text.append(newHistoryItem)
            let range = NSRange(location: allAct.text.count - 1, length: 1)
            allAct.scrollRangeToVisible(range)
        }
    }
    
    @IBAction func plusButtonTap(_ sender: Any) {
        cnt += 1
        let text : String = "Значение счётчика: \(cnt)"
        cntTouch.text = text
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = formatter.string(from: date)
        
        let newHistoryItem = "[\(formattedDate)]: значение изменено на +1\n"
        allAct.text.append(newHistoryItem)
        let range = NSRange(location: allAct.text.count - 1, length: 1)
        allAct.scrollRangeToVisible(range)
    }
    
    @IBAction func restartButtonTap(_ sender: Any) {
        cnt = 0
        let text : String = "Значение счётчика: \(cnt)"
        cntTouch.text = text
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = formatter.string(from: date)

        let newHistoryItem = "[\(formattedDate)]: значение сброшено\n"
        allAct.text.append(newHistoryItem)
        let range = NSRange(location: allAct.text.count - 1, length: 1)
        allAct.scrollRangeToVisible(range)
    }
      

}

