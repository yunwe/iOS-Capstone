import SwiftUI

struct ToastView: View {
    let message: String
    @Binding var isShowing: Bool
    
    var body: some View {
        if isShowing {
            VStack {
                Spacer()
                Text(message)
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                    .transition(.move(edge: .bottom))
            }
            .padding()
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, message: String) -> some View {
        ZStack {
            self
            ToastView(message: message, isShowing: isShowing)
        }
    }
}
