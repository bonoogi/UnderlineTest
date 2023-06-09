//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white

    let label = UILabel()
    label.frame = CGRect(x: 20, y: 200, width: 400, height: 80)
    label.attributedText = self.createAttributedString(withWhiteSpace: false)
    label.textColor = .black

    let label2 = UILabel()
    label2.frame = CGRect(x: 20, y: 300, width: 400, height: 80)
    label2.attributedText = self.createAttributedString(withWhiteSpace: true)
    label2.textColor = .black

    view.addSubview(label)
    view.addSubview(label2)
    self.view = view
  }

  private func createAttributedString(withWhiteSpace: Bool) -> NSAttributedString? {
    let text: String
    let effectRange: NSRange
    if withWhiteSpace {
      text = "(필수) 개인정보 수집 및 이용에 동의"
      effectRange = NSRange(location: 5, length: 12)
    } else {
      text = "(필수) 이용약관에 동의"
      effectRange = NSRange(location: 5, length: 4)
    }

    let mutable = NSMutableAttributedString(string: text)
    mutable.addAttributes(
      [.font: UIFont.systemFont(ofSize: 40)],
      range: NSRange(location: 0, length: text.count)
    )

    mutable.addAttributes(
      [
        .font: UIFont.systemFont(ofSize: 40, weight: .bold),
        .underlineStyle: NSUnderlineStyle.single.rawValue
      ],
      range: effectRange
    )

    return mutable
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
