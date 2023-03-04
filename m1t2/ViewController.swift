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
        button1.center.y=100
        button2.center.y=200
        button3.center.y=300
        button1.setTitle("Button11", for: .normal)
        button2.setTitle("Button11111111111", for: .normal)
        button3.setTitle("Button222", for: .normal)
        button1.sizeToFit()
        button2.sizeToFit()
        button3.sizeToFit()
        button1.center.x=view.frame.width/2
        button2.center.x=view.frame.width/2
        button3.center.x=view.frame.width/2
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
    }
    
    override func viewDidLayoutSubviews() {
        button1.center.y=100
        button2.center.y=200
        button3.center.y=300
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
    /* override var intrinsicContentSize: CGSize {
     let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude)) ?? .zero
     let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
     
     return desiredButtonSize
     }*/
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
    }
}

