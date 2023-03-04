//
//  ViewController.swift
//  m1t2
//
//  Created by Alex Antropoff on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let button1=MyButton()
    let button2=MyButton()
    let button3=MyButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.setTitleAndFit("Button11")
        button2.setTitleAndFit("Button11122221111")
        button3.setTitleAndFit("Button333")
        button1.center.x=view.frame.width/2
        button2.center.x=view.frame.width/2
        button3.center.x=view.frame.width/2
        button1.center.y=100
        button2.center.y=200
        button3.center.y=300
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
    }
    
    @objc func button3Tapped() {
        for subview in view.subviews {
            if let button = subview as? MyButton {
                button.backgroundColor = UIColor.gray
            }
        }
        let modalController = ModalViewController()
        
        modalController.dismissHandler = {
            for subview in self.view.subviews {
                if let button = subview as? MyButton {
                    button.backgroundColor = .blue
                }
            }
        }
        present(modalController, animated: true, completion: nil)
    }
}
class MyButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    @objc private func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut], animations: {
            self.transform = .identity
        }, completion: nil)
    }
    func setTitleAndFit(_ title:String){
        setTitle(title, for: .normal)
        sizeToFit()
    }
    private func initViews(){
        //     translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        layer.cornerRadius = 8
        tintColor = .white
        contentEdgeInsets = UIEdgeInsets(
            top: 10,
            left: 14,
            bottom: 10,
            right: 14+8
        )
        //   titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
        imageEdgeInsets=UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        semanticContentAttribute = .forceRightToLeft
        addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        addTarget(self, action: #selector(buttonReleased(_:)), for: .touchCancel)
    }
}


class ModalViewController: UIViewController {
    
    var dismissHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .pageSheet
        view.backgroundColor = .white
        self.presentationController?.delegate = self
    }
    
}
extension ModalViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController){
        self.dismissHandler?()
    }
}
