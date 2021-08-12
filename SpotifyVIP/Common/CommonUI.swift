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

public enum CommonSignupTextFieldType {
    case email
    case password
    case date
}

class CommonSignupTextField: UIView {
    private var title = ""
    private var footerTitle = ""
    private var type: CommonSignupTextFieldType = .email
    private let rightImage = UIImageView()
    private let datePicker = UIDatePicker()
    
    public var mainTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Gotham-Bold", size: 30)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
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
    
    required init(title: String, footerTitle: String, type: CommonSignupTextFieldType = .email) {
        self.title = title
        self.footerTitle = footerTitle
        super.init(frame: .null)
        self.configureView()
        self.buildWithType(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
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
    }
    
    private func buildWithType(type: CommonSignupTextFieldType) {
        switch type {
        case .email:
            setupTextField()
        case .password:
            setupPasswordTextField()
        case .date :
            setupDatePickerTextField()
        }
    }
    
    private func showPassword() {
        DispatchQueue.main.async {
            self.rightImage.image = CommonAssets.unlock
            self.textField.isSecureTextEntry = false
            self.textField.layoutSubviews()
        }
    }
    
    private func hidePassword() {
        DispatchQueue.main.async {
            self.rightImage.image = CommonAssets.lock
            self.textField.isSecureTextEntry = true
            self.textField.layoutSubviews()
        }
      
    }

    @objc private func rightImageDidTapped() {
        switch textField.isSecureTextEntry {
        case true:
            showPassword()
        default:
            hidePassword()
        }
        
        textField.isSecureTextEntry = !textField.isSecureTextEntry
    }
    
    private func setupDatePickerTextField() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker))
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
        
        constrain(self, mainTitle, textField, footerSubtitle) { view, title, textfield, footer in
            
            title.top == view.top + 4
            title.leftMargin == view.leftMargin
            title.rightMargin == view.rightMargin
            
            textfield.top == title.bottom + 20
            textfield.leftMargin == view.leftMargin
            textfield.rightMargin == view.rightMargin
            textfield.height == 70
            textfield.centerX == view.centerX
            
            footer.top == textfield.bottom + 1
            footer.leftMargin == view.leftMargin

        }
        
    }
    
    @objc private func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textField.text = formatter.string(from: datePicker.date)
        endEditing(true)
    }
    
    private func setupPasswordTextField() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(rightImageDidTapped))
        
        textField.isSecureTextEntry = true
        
        rightImage.isUserInteractionEnabled = true
        rightImage.addGestureRecognizer(tap)
        rightImage.contentMode = .scaleAspectFit
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightImage)
        rightImage.image = CommonAssets.lock
        
        constrain(self, mainTitle, textField, footerSubtitle, rightImage) { view, title, textfield, footer, image in
            
            title.top == view.top + 4
            
            textfield.top == title.bottom + 10
            textfield.leftMargin == view.leftMargin
            textfield.rightMargin == view.rightMargin
            textfield.height == 70
            textfield.centerX == view.centerX
            
            footer.top == textfield.bottom + 1
            footer.leftMargin == view.leftMargin
            
            image.width == 30
            image.height == 30
            image.centerY == textfield.centerY
            image.trailing == textfield.trailing
        }
    }
    
    private func setupTextField() {
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

