//
//  ViewController.swift
//  PresentationController
//
//  Created by Luis Santiago on 4/26/18.
//  Copyright © 2018 Luis Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let containerImage : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    

    private let imageView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "blue-bus"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("PREV", for: .normal)
        return button
    }()
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1), for: .normal)
        return button
    }()
    
    
    private let pageControl : UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 4
        page.pageIndicatorTintColor = .gray
        page.currentPageIndicatorTintColor = .red
        return page
    }()
    
  
    private let titleTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributeText = NSMutableAttributedString(string:  "Join us today in our fun and games" , attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSAttributedString(string: "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas blandit pellentesque aliquet. Mauris rhoncus massa sed justo tristique, in scelerisque ipsum tincidunt.",
                                                attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13) , NSAttributedStringKey.foregroundColor : UIColor.gray]))
        textView.attributedText = attributeText
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        view.addSubview(containerImage)
        view.addSubview(titleTextView)
        setUpLayout()
        setUpControls()
    }
    
    private func setUpLayout(){
        NSLayoutConstraint.activate([
            containerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerImage.topAnchor.constraint(equalTo: view.topAnchor),
            containerImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            containerImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            titleTextView.topAnchor.constraint(equalTo: containerImage.bottomAnchor , constant : -20),
            titleTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant : 20),
            titleTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant : -20),
            titleTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        setImageLayout()
    }
    
    private func setImageLayout(){
        containerImage.addSubview(imageView)
        NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: containerImage.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: containerImage.centerYAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                imageView.widthAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    fileprivate func setUpControls(){
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton , pageControl , nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.axis = .horizontal
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
                //previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

}

