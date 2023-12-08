import UIKit

public class Button: UIView {
    var dataView: UIView!
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var button: UIButton!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI(borderColor: UIColor? = nil) {
        dataView = self.loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dataView.layer.cornerRadius = 10
        dataView.layer.cornerCurve = .continuous
        button.titleLabel?.font =  UIFont(name: "RedHatDisplay-SemiBold", size: 14)
    }
    
    private func setupBorder(borderColor: UIColor?) {
        if let borderColor = borderColor {
            dataView.layer.borderWidth = 1.0
            dataView.layer.borderColor = borderColor.cgColor
        }
    }
    
    private func setupTextColor(color: UIColor?) {
        if let color = color {
            button.setTitleColor(color, for: .normal)
        }
    }
    
    private func setupPadding(spacing: CGFloat?) {
        if let spacing = spacing {
            self.button.configuration?.imagePadding = spacing
        }
    }
}

public extension Button {
    func setup(
        text: String,
        backgroundColor: UIColor,
        image: UIImage,
        borderColor: UIColor? = nil,
        textColor: UIColor? = nil,
        spacing: CGFloat? = nil
    ) {
        self.view.backgroundColor = backgroundColor
        self.button.setTitle(text, for: .normal)
        self.button.setImage(image, for: .normal)
        
        setupBorder(borderColor: borderColor)
        setupTextColor(color: textColor)
        setupPadding(spacing: spacing)
    }
}
