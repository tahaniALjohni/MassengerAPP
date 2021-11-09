//
//  ChatViewController.swift
//  massengerApp
//
//  Created by T Aljohni on 28/03/1443 AH.
//

import UIKit
import MessageKit
import Firebase
import FirebaseDatabase
import InputBarAccessoryView


struct Message: MessageType {
     var sender: SenderType // sender for each message
    var messageId: String // id to de duplicate
     var sentDate: Date // date time
     var kind: MessageKind // text, photo, video, location, emoji
}
// sender model
struct Sender: SenderType {
     var photoURL: String // extend with photo URL
    public var senderId: String
    public var displayName: String
}
class ChatViewController: MessagesViewController {
    
        private var messages = [MessageType]()

    
     var selfSender = Sender(photoURL: "",
                                    senderId: "1",
                                    displayName: "hello")

    override func viewDidLoad() {
        super.viewDidLoad()
//        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("hello")))
//        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("hello hello")))
        view.backgroundColor = .gray
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        
        let current = FirebaseAuth.Auth.auth().currentUser
        print("CurrentUser \(String(describing: current))")
        DatabaseManger.shared.fetchConversation(path: "test-gmail-com") { [self] result in
            switch result{
            case .success(let messageText):
                let message = Message(sender: selfSender, messageId: "", sentDate: Date(), kind: .text(messageText))
                self.messages.append(message)
                
                DispatchQueue.main.async {
                    self.messagesCollectionView.reloadData()
                }
            case .failure(_):
                print("Error no message")
            }
        }
    }
    }
extension ChatViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print ("\(text)")

          // 2
          //save(message)

          // 3
          inputBar.inputTextView.text = ""
        
        DatabaseManger.shared.Conversation(Message: text, sendemail: "test-gmail-com",reciveemail:"test2-gmail-com")
    }
}
   

extension ChatViewController : MessagesDataSource , MessagesLayoutDelegate , MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return Sender(photoURL: "Example", senderId: "", displayName: "displayName")
        
    }
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath
      ) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(
          string: name,
          attributes: [
            .font: UIFont.preferredFont(forTextStyle: .caption1),
            .foregroundColor: UIColor(white: 0.3, alpha: 1)
          ])
      }

}
