//
//  CommonUI.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 08/08/21.
//

import UIKit
import Cartography

// MARK: - LABELS
extension UILabel {
    public var bannerLabel : UILabel {
        get {
            font = UIFont(name: "Gotham-Bold", size: 30)
            translatesAutoresizingMaskIntoConstraints = false
            return self
        }
    }
    
    public var mainTitleLabel: UILabel {
        get {
            font = UIFont(name: "GothamMedium", size: 17)
            textColor = UIColor.white
            translatesAutoresizingMaskIntoConstraints = false
            return self
        }
    }
    
    public var navigationTitle: UILabel {
        get {
            font = UIFont(name: "Gotham-Bold", size: 13)
            textColor = UIColor.white
            translatesAutoresizingMaskIntoConstraints = false
            return self
        }
    }
}

// MARK: - BUTTONS

class RoundedFillButton: UIButton {
    private var title = ""
    private var color = UIColor.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(title: String, color: UIColor) {
        self.title = title
        self.color = color
        super.init(frame: .null)
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        let attributeds = NSAttributedString(string: title,attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont(name: "Gotham-Bold", size: 17) ?? UIFont()])
        
        setAttributedTitle(attributeds, for: .normal)
        backgroundColor = color
        layer.masksToBounds = true
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

class RoundedButton: UIButton {
    private var title = ""
    private var color = UIColor.white
    private var image: UIImage?
    private var hasBorder: Bool = true
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(title: String, image: UIImage? = nil, hasBorder: Bool = true) {
        self.title = title
        self.image = image
        self.hasBorder = hasBorder
        super.init(frame: .null)
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        let attributeds = NSAttributedString(string: title,attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont(name: "Gotham-Bold", size: 17) ?? UIFont()])
        
        setAttributedTitle(attributeds, for: .normal)
        backgroundColor = UIColor.mainBackground
        layer.borderWidth = 0.3
        layer.borderColor = hasBorder ? UIColor.white.cgColor :  UIColor.mainBackground.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
        
        let leftImage = UIImageView()
        leftImage.contentMode = .scaleAspectFit
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftImage)
        leftImage.image = self.image ?? UIImage()
        
        constrain(self, leftImage) { button, image in
            image.width == 30
            image.height == 30
            image.centerY == button.centerY
            image.leading == button.leading + 14
        }
    }
}

class CommonSignupTextField: UIView {
    private var title = ""
    private var footerTitle = ""
    
    public var mainTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 30)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var textField: UITextField = {
       let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public var footerSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 10)
        label.textColor = UIColor.textfieldGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(title: String, footerTitle: String ) {
        self.title = title
        self.footerTitle = footerTitle
        super.init(frame: .null)
        self.setupTextField()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.mainBackground
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.textfieldGrey
        textField.textColor = UIColor.white
        textField.font = UIFont(name: "Gotham-Bold", size: 20)
        addSubview(mainTitle)
        addSubview(textField)
        addSubview(footerSubtitle)
        
        mainTitle.text = title
        footerSubtitle.text = footerTitle
        
        constrain(self, mainTitle, textField, footerSubtitle) { view, title, textfield, footer in
            
            title.top == view.top + 4
            
            textfield.top == title.bottom + 10
            textfield.leftMargin == view.leftMargin
            textfield.rightMargin == view.rightMargin
            textfield.height == 70
            textfield.centerX == view.centerX
            
            footer.top == textfield.bottom + 1
            footer.leftMargin == view.leftMargin
        }
    }
}

class RoundedActionButton: UIButton {
    private var title = ""
    private var color = UIColor.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(title: String, color: UIColor) {
        self.title = title
        self.color = color
        super.init(frame: .null)
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        let attributeds = NSAttributedString(string: title.uppercased(),attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont(name: "Gotham-Bold", size: 17) ?? UIFont()])
        
        setAttributedTitle(attributeds, for: .normal)
        backgroundColor = color
        layer.masksToBounds = true
        layer.cornerRadius = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        constrain(self) { button in 
            button.width == 200
            button.height == 60
        }
    }
    
}

