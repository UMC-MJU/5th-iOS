
import UIKit

class ViewController: UIViewController {

    let GameImageData = ["img_rock","img_scissors","img_paper"]
    
    
    lazy var playStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var computerGameImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var myGameImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
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
        let computer = GameImageData.randomElement() ?? "img_rock"
        computerGameImageView.image = UIImage(named: computer)
        myGameImageView.image = UIImage(named: "img_scissors")
        
    }
    @objc func didTapChangeDiceImageButton2(){
        let computer = GameImageData.randomElement() ?? "img_rock"
        computerGameImageView.image = UIImage(named: computer)
        myGameImageView.image = UIImage(named: "img_rock")
        
    }
    @objc func didTapChangeDiceImageButton3(){
        let computer = GameImageData.randomElement() ?? "img_rock"
        computerGameImageView.image = UIImage(named: computer)
        myGameImageView.image = UIImage(named: "img_paper")
        
    }
}
