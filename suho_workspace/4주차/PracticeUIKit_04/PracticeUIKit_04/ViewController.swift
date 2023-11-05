
import UIKit

class ViewController: UIViewController {

    let GameImageData:[InputState] = [.scissors, .rock, .paper]
    
    enum InputState: String {
        case scissors
        case rock
        case paper
        
    }
    
    lazy var playStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var computerGameImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var myGameImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gameResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과는?"
        label.textColor = .white
        return label
    }()
    lazy var playerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Player"
        label.textColor = .white
        return label
    }()
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Computer"
        label.textColor = .white
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var rockButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var scissorsButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var paperButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
   
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
        view.addSubview(computerLabel)
        view.addSubview(playerLabel)
        computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 20).isActive = true
        computerLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor, constant: -80).isActive = true
        playerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 20).isActive = true
        playerLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor, constant: 80).isActive = true
        
        
        view.addSubview(gameResultLabel)
        gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 20).isActive = true
        gameResultLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        view.addSubview(buttonStackView)
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        buttonStackView.addArrangedSubview(scissorsButton)
        buttonStackView.addArrangedSubview(rockButton)
        buttonStackView.addArrangedSubview(paperButton)
        
        
        scissorsButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for:  .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapChangeDiceImageButton2), for:  .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeDiceImageButton3), for:  .touchUpInside)
        
        
    }
    
    @objc func didTapChangeDiceImageButton(){
        myGameImageView.image = UIImage(named: "scissors")
        let randomInput = GameImageData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .scissors, computerInput: randomInput)
        
    }
    @objc func didTapChangeDiceImageButton2(){
        myGameImageView.image = UIImage(named: "rock")
        let randomInput = GameImageData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .rock, computerInput: randomInput)
        
    }
    @objc func didTapChangeDiceImageButton3(){
        myGameImageView.image = UIImage(named: "paper")
        let randomInput = GameImageData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .paper, computerInput: randomInput)
        
    }
    
    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> String{
        // 내가 낸 값과 컴퓨터의 값
        switch myInput {
            
        case .scissors:
            switch computerInput {
                
            case .scissors:
                return "비김"
            case .rock:
                return "짐"
            case .paper:
                return "이김"
            }
        case .rock:
            switch computerInput {
                
            case .scissors:
                return "이김"
            case .rock:
                return "비김"
            case .paper:
                return "짐"
            }
        case .paper:
            switch computerInput {
                
            case .scissors:
                return "짐"
            case .rock:
                return "이김"
            case .paper:
                return "비김"
                
            }
        }
    }
}
