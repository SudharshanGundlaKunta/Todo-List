//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by Sudharshan on 06/07/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var stckView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        
        stckView.layer.cornerRadius = 8
        
    }
    
    func updateDdata(_ data: List) {
        
        if data.isCompleted {
            self.doneButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            self.doneButton.tintColor = .green
            self.label.attributedText = data.task.withStrikethrough()
            self.label.textColor = .gray
            stckView.layer.shadowColor = UIColor.black.cgColor
            stckView.layer.shadowRadius = 2
            stckView.layer.shadowOffset = CGSize(width: 2, height: 2)
            stckView.layer.shadowOpacity = 0.3
        }else {
            self.doneButton.setImage(UIImage(systemName: "circle"), for: .normal)
            self.doneButton.tintColor = .gray
            self.label.textColor = .black
            self.label.attributedText = data.task.withoutStrikethrough()
            self.stckView.backgroundColor = .white
            stckView.layer.shadowColor = UIColor.black.cgColor
            stckView.layer.shadowRadius = 5
            stckView.layer.shadowOffset = CGSize(width: 5, height: 5)
            stckView.layer.shadowOpacity = 0.3
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
