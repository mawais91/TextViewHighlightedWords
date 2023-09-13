import UIKit

class ViewController: UIViewController {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 40)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create an attributed string
        let text = "In today's fast-paced world, technology plays an integral role in our daily lives. From smartphones that keep us connected to the internet, to artificial intelligence simplifying tasks, technology has revolutionized the way we live and work. It has opened new avenues for communication, transformed industries, and empowered individuals. However, with great power comes responsibility. We must use technology wisely, addressing concerns like privacy and digital well-being. Striking a balance between the convenience of technology and its potential drawbacks is crucial. As we move forward, harnessing the benefits of technology while being mindful of its impact on society will be a defining challenge of our time."
        
        // Set the attributed text in the UITextView
        textView.text = text
        textView.font = UIFont(name: "Teko-Bold", size: 30) ?? UIFont.systemFont(ofSize: 25)
        textView.textAlignment = .left
        textView.setLineHeight(-5)
        
        // Add the textView to the view
        view.addSubview(textView)
        
        // Add constraints to position and size the UITextView
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            // Adjust the height constraint based on the font size and line spacing
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])

        
        let font = UIFont(name: "Teko-Bold", size: 25) ?? UIFont.systemFont(ofSize: 30)
        textView.highlightWordsWithBackground([
            ("world", UIColor.yellow, font, 8),
            ("intelligence", UIColor.green, font, 5),
            ("lives", UIColor.brown, font, 3),
            ("responsibility", UIColor.blue, font, 10),
            ("convenience", UIColor.blue, font, 10),
            ("challenge", UIColor.magenta, font, 6),
            ("time", UIColor.systemPink, font, 6)
        ], lineHeight: -5)
    }
    
    @IBAction func didTapListView(_ sender: Any) {
        let viewController = TableViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
