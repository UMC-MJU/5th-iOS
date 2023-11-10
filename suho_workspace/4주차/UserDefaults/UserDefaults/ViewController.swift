import UIKit
import SnapKit

class ViewController: UIViewController {

    let mainText = UILabel()
    let IDField = UITextField()
    let IDhintLabel = UILabel()
    let PWField = UITextField()
    let PWhintLabel = UILabel()
    let loginbtn = UIButton()
    let registbtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        // UITextField 설정
        IDField.borderStyle = .none // 테두리를 없애고 직접 설정합니다.
        IDField.layer.cornerRadius = 8.0
        IDField.layer.borderWidth = 2.0 // 테두리 두께 설정
        IDField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상 설정
        IDField.addLeftPadding(10) // 패딩 추가
        IDField.autocapitalizationType = .none // 첫글자 대문자 속성
        view.addSubview(IDField)
        IDField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(340)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(40)
        }
        
        // Hint Label 설정
        IDhintLabel.text = "ID"
        IDhintLabel.textColor = .lightGray
        view.addSubview(IDhintLabel)
        IDhintLabel.snp.makeConstraints { make in
            make.top.equalTo(IDField.snp.top).offset(10)
            make.leading.equalTo(IDField.snp.leading).offset(10)
        }
        
        // UITextField와 Hint Label 연결
        IDField.addTarget(self, action: #selector(IDFieldEditingChanged), for: .editingChanged)
        
        view.addSubview(mainText)
        mainText.text = "Welcome"
        mainText.font = .boldSystemFont(ofSize: 30)
        mainText.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(IDField.snp.top).offset(-100)
        }
        
        // PWField 설정
        PWField.borderStyle = .none
        PWField.layer.cornerRadius = 8.0
        PWField.layer.borderWidth = 2.0
        PWField.layer.borderColor = UIColor.lightGray.cgColor
        PWField.addLeftPadding(10)
        PWField.autocapitalizationType = .none // 첫 글자 대문자 속성
        
        view.addSubview(PWField)
        PWField.snp.makeConstraints { make in
            make.top.equalTo(IDField.snp.bottom).offset(10) // IDField 바로 아래에 위치
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(40)
        }

        // PWField Hint Label 설정
        PWhintLabel.text = "Password"
        PWhintLabel.textColor = .lightGray
        // 비밀번호 블러처리 코드
        // PWField.isSecureTextEntry = true
        view.addSubview(PWhintLabel)
        PWhintLabel.snp.makeConstraints { make in
            make.top.equalTo(PWField.snp.top).offset(10)
            make.leading.equalTo(PWField.snp.leading).offset(10)
        }
        PWField.addTarget(self, action: #selector(PWFieldEditingChanged), for: .editingChanged)
        
        //loginButton 설정
        loginbtn.setTitle("로그인", for: .normal)
        loginbtn.setTitleColor(.white, for: .normal)
        loginbtn.backgroundColor = .blue
        loginbtn.layer.cornerRadius = 8.0 // 원하는 둥근 정도로 조절
        loginbtn.layer.masksToBounds = true // 모서리를 둥글게 만든 레이어를 클리핑
        view.addSubview(loginbtn)
        
        loginbtn.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(PWField.snp.bottom).offset(10)
            make.leading.equalTo(PWField.snp.leading)
            make.height.equalTo(PWField.snp.height)
        }
        loginbtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        //registerButton 설정
        registbtn.setTitle("회원가입", for: .normal)
        registbtn.setTitleColor(.white, for: .normal)
        registbtn.backgroundColor = .blue
        registbtn.layer.cornerRadius = 8.0 // 원하는 둥근 정도로 조절
        registbtn.layer.masksToBounds = true // 모서리를 둥글게 만든 레이어를 클리핑
        view.addSubview(registbtn)
        
        registbtn.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginbtn.snp.bottom).offset(10)
            make.leading.equalTo(PWField.snp.leading)
            make.height.equalTo(PWField.snp.height)
        }
        registbtn.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc func IDFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            // 텍스트 필드에 텍스트가 입력되면 힌트 레이블 숨기기
            IDhintLabel.isHidden = true
        } else {
            // 텍스트 필드가 비어있을 때 힌트 레이블 표시
            IDhintLabel.isHidden = false
        }
    }
    
    @objc func PWFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty{
            PWhintLabel.isHidden = true
        }
        else {
            PWhintLabel.isHidden = false
        }
    }
    // 로그인 버튼 액션 함수
    @objc func loginButtonTapped() {
        // 로그인 버튼이 눌렸을 때 실행할 코드를 작성
        if let text = IDField.text, text.isEmpty {
            print("IDField is empty!")
        }
        else if let text = PWField.text, text.isEmpty {
            print("PWField is empty")
        }
        else{
            if let enteredID = IDField.text, let enteredPassword = PWField.text {
                        login(with: enteredID, password: enteredPassword)
                    }
        }
           
    }

    // 회원가입 버튼 액션 함수
    @objc func registerButtonTapped() {
        // 회원가입 버튼이 눌렸을 때 실행할 코드를 작성
        if let text = IDField.text, text.isEmpty {
            print("IDField is empty!")
        }
        else if let text = PWField.text, text.isEmpty {
            print("PWField is empty")
        }
        else{
            if let enteredID = IDField.text, let enteredPassword = PWField.text {
                        register(with: enteredID, password: enteredPassword)
                    }
            
        }
    }
    func register(with enteredID: String, password enteredPassword: String) {
        if !isIDAlreadyRegistered(enteredID){
            var accounts = UserDefaults.standard.dictionary(forKey: "accounts") ?? [:]
            accounts[enteredID] = enteredPassword
            
            UserDefaults.standard.set(accounts, forKey: "accounts")
            mainText.text = "등록완료"
        }
        else{
            mainText.text = "등록실패"
        }
      }
    
    func login(with enteredID: String, password enteredPassword: String){
        if isIDAlreadyRegistered(enteredID){
            let accounts = UserDefaults.standard.dictionary(forKey: "accounts")
            if accounts?[enteredID] as! String == enteredPassword {
                mainText.text = "로그인 성공"
            }
            else{
                mainText.text = "비밀번호 오류"
            }
        }
        else{
            mainText.text = "등록되지 않은 아이디"
        }
    }
    
    func isIDAlreadyRegistered(_ id: String) -> Bool{
        if let accounts = UserDefaults.standard.dictionary(forKey: "accounts"){
            return accounts[id] != nil
        }
        return false
    }
    
}

extension UITextField {
    
    func addLeftPadding(_ padding:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
