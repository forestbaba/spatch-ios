//
//  RadioButtonStack.swift
//  Spatch
//
//  Created by Adeoy3 on 27/06/2024.
//

import UIKit

class RadioButtonsStack: UIView {
    
    let brandColor = UIColor(named: "brandColor")


    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 12
        return view
    }()

    var radioViews = [RadioButtonView]()

    var selectedIndex: Int?

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func set(_ options: [DispatchTypeOptions]) {
        radioViews.removeAll()
        stackView.removeAllArrangedSubviews()
        
        for (index, text) in options.enumerated() {
            let radioView: RadioButtonView = {
                let view = RadioButtonView()
                view.radioButton.tag = index
                view.radioButton.addTarget(self, action: #selector(radioSelected(_:)), for: .valueChanged)
                view.set(options[index].title)
                view.setIconName(options[index].iconName)
                return view
            }()
            stackView.addArrangedSubview(radioView)
            radioViews.append(radioView)
        }
    }

    @objc private func radioSelected(_ sender: RadioButton?) {
        guard let sender else { return }
        selectedIndex = sender.tag
        
        radioViews.forEach {
            print(sender.tag)
            $0.select($0.radioButton.tag == sender.tag)
        }
    }

    class RadioButtonView: UIView {
        let brandColor = UIColor(named: "brandColor")

        let radioButton: RadioButton = {
            let radioButton = RadioButton(frame: .zero)
            radioButton.translatesAutoresizingMaskIntoConstraints = false
            return radioButton
        }()

        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 18)
            return label
        }()
        
        var iconName: (String) = "arrow.right" {
            didSet {
                icon.image = UIImage(systemName: iconName)
            }
        }
        
        
        let icon: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()

        let stackView: UIStackView = {
            let brandColor = UIColor(named: "brandColor")
            let brandLightgrey = UIColor(named: "lightGray")

            let view = UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.distribution = .fill
            view.axis = .horizontal
            view.spacing = 16
            view.backgroundColor = brandLightgrey
            view.layer.cornerRadius = 10
            
            return view
        }()
        

        init() {
            super.init(frame: .zero)
            setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }

        func setup() {
            addSubview(stackView)
            
            stackView.addSubview(icon)
            icon.anchor(top: topAnchor,left: leftAnchor, bottom: bottomAnchor, paddingTop: 15, paddingBottom: 15, paddingRight:5, width: 50)

            stackView.addSubview(radioButton)
//            stackView.addArrangedSubview(radioButton)
//            stackView.addSubview(radioButton)
            stackView.addSubview(label)
        //    stackView.addArrangedSubview(label)

            label.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 15, paddingLeft: 50, paddingBottom: 15, width: 200)

            radioButton.anchor(top: topAnchor,bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingBottom: 15, paddingRight:20, width: 50)

            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                radioButton.widthAnchor.constraint(equalToConstant: 30)
            ])
        }

        func set(_ text: String) {
            label.text = text
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        func setIconName(_ iconName: String){
            icon.image = UIImage(systemName: iconName)
            icon.tintColor = brandColor
        }
        
        func select(_ select: Bool) {
            radioButton.isOn = select
        }
    }
}

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
