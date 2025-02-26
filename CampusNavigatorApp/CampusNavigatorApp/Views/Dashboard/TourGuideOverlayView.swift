import SwiftUI

struct TourGuideOverlayView: View {
    @State private var currentStep = 1
    @State private var opacity: Double = 0
    var onComplete: () -> Void
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
                .opacity(opacity)
            
            VStack {
                Spacer()
                
                // Guide image with message
                VStack {
                    // Buttons on last step
                    if currentStep == 4 {
                        HStack {
                            Spacer()
                            
                            HStack(spacing: 5) {
                                Button(action: {
                                    // Navigate to Tour Guide
                                    onComplete()
                                }) {
                                    Text("Tour Guide")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color(hexString: "#FF6B35"))
                                        .cornerRadius(20)
                                }
                                
                                Button(action: {
                                    onComplete()
                                }) {
                                    Text("Skip")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(Color(hexString: "#4C4C4C"))
                                        .cornerRadius(20)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    
                    // Guide image
                    Image(guideImageName())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 200)
                
                Spacer()
                
                // Tap to continue text (only for steps 1-3)
                if currentStep < 4 {
                    Text("Tap to continue")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
            }
        }
        .contentShape(Rectangle()) // Make entire view tappable
        .onTapGesture {
            if currentStep < 4 {
                currentStep += 1
            } else {
                onComplete()
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.3)) {
                opacity = 1.0
            }
        }
    }
    
    private func guideImageName() -> String {
        switch currentStep {
        case 1:
            return "GuideMsg1"
        case 2:
            return "GuideMsg2"
        case 3:
            return "GuideMsg3"
        case 4:
            return "GuideMsg4"
        default:
            return "GuideMsg1"
        }
    }
}
