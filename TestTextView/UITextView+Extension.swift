//
//  UITextView+Extension.swift
//  TestTextView
//
//  Created by Muhammad  Awais on 08/09/2023.
//

import UIKit

extension UITextView {
    
    func setLineHeight(_ lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight // Adjust this value as needed
        let attributedText = NSMutableAttributedString(attributedString: attributedText)
        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        self.attributedText = attributedText
    }
    
    func highlightWordsWithBackground(_ highlights: [(word: String, backgroundColor: UIColor, font: UIFont, cornerRadius: CGFloat)], lineHeight: CGFloat = 0.0) {
        
        for (word, backgroundColor, font, cornerRadius) in highlights {
            if let range = attributedText.string.range(of: word, options: .caseInsensitive) {
                let nsRange = NSRange(range, in: attributedText.string)
                
                let attributedString = NSMutableAttributedString(attributedString: self.attributedText)
                
                // Apply the font to the range
                attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: nsRange)
                
                self.attributedText = attributedString
                
                // Create a background view with rounded corners
                let backgroundView = UIView()
                backgroundView.tag = 100
                backgroundView.backgroundColor = backgroundColor
                backgroundView.layer.cornerRadius = cornerRadius
                backgroundView.clipsToBounds = true
                
                // Calculate the frame for the background view based on the text container's layout manager
                let layoutManager = self.layoutManager
                let textContainer = self.textContainer
                let glyphRange = layoutManager.glyphRange(forCharacterRange: nsRange, actualCharacterRange: nil)
                let boundingRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
                
                let fontLineHeight = font.lineHeight
                
                var yPosition = boundingRect.origin.y + 7
                
                if let textViewFont = self.font {
                    yPosition = font.pointSize<textViewFont.pointSize ? boundingRect.origin.y + 7 + (textViewFont.pointSize - font.pointSize):boundingRect.origin.y + 7
                }
                
                if lineHeight < 0 {
                    yPosition += lineHeight
                }
                
                backgroundView.frame = CGRect(x: boundingRect.origin.x-4, y: yPosition, width: boundingRect.size.width+8, height: fontLineHeight)
                self.addSubview(backgroundView)
                self.sendSubviewToBack(backgroundView)
            }
        }
    }
}

extension UITextView {
    func setHighlightedWords(highlights: [(word: String, font: UIFont)]) {
        for (word, font) in highlights {
            if let range = attributedText.string.range(of: word, options: .caseInsensitive) {
                let nsRange = NSRange(range, in: attributedText.string)
                
                let attributedString = NSMutableAttributedString(attributedString: self.attributedText)
                
                // Apply the font to the range
                attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: nsRange)
                
                self.attributedText = attributedString
            }
        }
    }
    
    func setWordsBackground(_ highlights: [(word: String, backgroundColor: UIColor, font: UIFont, cornerRadius: CGFloat)], lineHeight: CGFloat = 0.0) {
        
        for (word, backgroundColor, font, cornerRadius) in highlights {
            if let range = attributedText.string.range(of: word, options: .caseInsensitive) {
                let nsRange = NSRange(range, in: attributedText.string)
                
                // Create a background view with rounded corners
                let backgroundView = UIView()
                backgroundView.tag = 100
                backgroundView.backgroundColor = backgroundColor
                backgroundView.layer.cornerRadius = cornerRadius
                backgroundView.clipsToBounds = true
                
                // Calculate the frame for the background view based on the text container's layout manager
                let layoutManager = self.layoutManager
                let textContainer = self.textContainer
                let glyphRange = layoutManager.glyphRange(forCharacterRange: nsRange, actualCharacterRange: nil)
                let boundingRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
                
                let fontLineHeight = font.lineHeight
                var yPosition = boundingRect.origin.y + 7
                
                if let textViewFont = self.font {
                    yPosition = font.pointSize<textViewFont.pointSize ? boundingRect.origin.y + 7 + (textViewFont.pointSize - font.pointSize):boundingRect.origin.y + 7
                }
                
                if lineHeight < 0 {
                    yPosition += lineHeight
                }
                
                backgroundView.frame = CGRect(x: boundingRect.origin.x-4, y: yPosition, width: boundingRect.size.width+8, height: fontLineHeight)
                
                self.addSubview(backgroundView)
                self.sendSubviewToBack(backgroundView)
            }
        }
    }
    
    func removeWordsBackground() {
        for subview in subviews {
            if subview.tag == 100 {
                subview.removeFromSuperview()
            }
        }
    }
}

class InAppPurchaseOfferMenuCellsUserReviewsHeaderTableViewCell: UITableViewCell, UITextViewDelegate {
    
    // Callback closure to be called when text changes
    var textDidChangeCallback: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let headlineLabel2: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = UIFont(name: "Teko-Bold", size: 30.0)
        textView.textColor = UIColor.black
        return textView
    }()
    
    func setupViews() {
        backgroundColor = UIColor.clear
        addSubview(headlineLabel2)
        headlineLabel2.delegate = self // Set the delegate to self
        headlineLabel2.isScrollEnabled = false
        
        let leftAnchor = UIScreen.main.bounds.width * 0.05
        
        headlineLabel2.topAnchor.constraint(equalTo: self.topAnchor, constant: 14.0).isActive = true
        headlineLabel2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6.0).isActive = true
        headlineLabel2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftAnchor).isActive = true
        headlineLabel2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1 * leftAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Force layout before calculating frame
        self.layoutIfNeeded()

        // Calculate the frame for subviews here
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UITextViewDelegate method to capture text changes
    func textViewDidChange(_ textView: UITextView) {
        // Call the callback closure with the updated text
        if let text = textView.text {
            textDidChangeCallback?(text)
        }
    }
}
