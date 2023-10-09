
import UIKit

class ViewController: UIViewController {

    let diceImageNameData = ["dice-six-faces-one", "dice-six-faces-two", "dice-six-faces-three", "dice-six-faces-four", "dice-six-faces-five", "dice-six-faces-six"]
    
    lazy var doubleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴려주세요!"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var playStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var diceImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice-six-faces-one"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var secondDiceImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice-six-faces-one"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(diceImageView)
        playStackView.addArrangedSubview(secondDiceImageView)
  
        view.addSubview(doubleLabel)
        doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30).isActive = true
        doubleLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        view.addSubview(changeButton)
        
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for:  .touchUpInside)
        
    }
    
    @objc func didTapChangeDiceImageButton(){
        let firstDice = diceImageNameData.randomElement() ?? "dice-six-faces-one"
        let secondDice = diceImageNameData.randomElement() ?? "dice-six-faces-one"
        diceImageView.image = UIImage(named: firstDice)
        secondDiceImageView.image = UIImage(named: secondDice)
        if firstDice == secondDice {
            doubleLabel.text = "DOUBLE!!"
        }
        else{
            doubleLabel.text = "다시 굴려주세요!!"
        }
    }
}
