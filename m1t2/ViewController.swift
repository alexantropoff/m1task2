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
        button2.center.y=150
        button3.center.y=200
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchDown)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
    }
    
    @objc func button3Tapped() {
        let modalController = UIViewController()
        modalController.modalPresentationStyle = .pageSheet
        modalController.view.backgroundColor = .white
        present(modalController, animated: true, completion: nil)
    }
}

class MyButton: UIButton{
    var animator: UIViewPropertyAnimator!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    override func tintColorDidChange(){
        super.tintColorDidChange()
        if(tintAdjustmentMode == .dimmed){
            backgroundColor = .gray
        }else{
            backgroundColor = .blue
        }
    }
    private func animate(_ pressed: Bool){
        if animator.isRunning {
            animator.stopAnimation(true)
        }
        animator.addAnimations {
            self.transform = pressed ? CGAffineTransform(scaleX: 0.9, y: 0.9):.identity
        }
        animator.startAnimation()
        
    }
    @objc private func buttonPressed(_ sender: UIButton) {
        animate(true)
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        animate(false)
    }
    func setTitleAndFit(_ title:String){
        setTitle(title, for: .normal)
        sizeToFit()
    }
    private func initViews(){
        animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut)
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

