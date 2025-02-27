import SwiftUI

struct ChatBotView: View {
    @State private var messageText = ""
    
    let botMessages: [BotMessage] = [
        BotMessage(
            text: "Hey there! I'm your Campus Navigator Bot 🤖. How can I assist you today?",
            options: ["See upcoming events", "See Campus Q&A", "Check cafeteria crowd levels", "Find a building"]
        ),
        BotMessage(
            text: "Right now, the cafeteria is moderately crowded. Best time to visit: 2:00 PM - 3:00 PM. Need a route to get there?"
        )
    ]
    
    let userMessages = [
        "Check cafeteria crowd levels",
        "Yes, show me the way!"
    ]
    
    var body: some View {
        ZStack {
            // Background shape
            Image("shape")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 500)
                .edgesIgnoringSafeArea(.top)
                .position(x: UIScreen.main.bounds.width / 2, y: 0)
            
            VStack {
                // Messages scroll view
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<botMessages.count, id: \.self) { index in
                            // Bot message
                            BotMessageView(message: botMessages[index])
                                .padding(.top, 16)
                                .padding(.bottom, 8)
                            
                            // Options if available
                            if let options = botMessages[index].options {
                                OptionsView(options: options)
                                    .padding(.leading, 40)
                                    .padding(.bottom, 8)
                            }
                            
                            // User message if available
                            if index < userMessages.count {
                                UserMessageView(message: userMessages[index])
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                // Message input field
                HStack(spacing: 16) {
                    HStack {
                        TextField("Type a message...", text: $messageText)
                            .font(.system(size: 16))
                            .foregroundColor(Color.darkGray)
                        
                        Button(action: {
                            // Microphone action
                        }) {
                            Image("mic-icon")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 48)
                            .stroke(Color(hexString: "#979C9E"), lineWidth: 1.5)
                    )
                    
                    Button(action: {
                        // Send message action
                    }) {
                        Image("send-icon")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.darkGray)
                            .cornerRadius(22)
                    }
                    .frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
        .background(Color.white)
    }
}

struct BotMessageView: View {
    let message: BotMessage
    
    var body: some View {
        HStack(alignment: .top) {
            // Bot avatar
            ZStack {
                Circle()
                    .fill(Color(hexString: "#F2F8FF"))
                    .frame(width: 32, height: 32)
                
                Image("bot")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            
            // Message bubble
            Text(message.text)
                .font(.system(size: 16))
                .lineSpacing(8)
                .foregroundColor(Color.darkGray)
                .padding(16)
                .background(Color(hexString: "#F2F4F5"))
                .cornerRadius(12)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: .leading)
                .padding(.leading, 8)
        }
    }
}

struct OptionsView: View {
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    // Option selected action
                }) {
                    Text(option)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.secondary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .background(Color(hexString: "#F2F8FF"))
                        .cornerRadius(24)
                }
            }
        }
    }
}

struct UserMessageView: View {
    let message: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .font(.system(size: 16))
                .lineSpacing(8)
                .foregroundColor(Color.white)
                .padding(16)
                .background(Color.secondary)
                .cornerRadius(12)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: .trailing)
        }
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
