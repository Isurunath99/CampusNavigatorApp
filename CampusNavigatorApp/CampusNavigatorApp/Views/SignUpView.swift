import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = "Mahel"
    @State private var lastName: String = "Chandupa"
    @State private var email: String = "mahel@gmail.com"
    @State private var indexNumber: String = "KAHDSE-221F"
    @State private var password: String = "*******"
    @State private var showPassword: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Logo
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                // Title and Sign In Link
                VStack(spacing: 8) {
                    Text("Sign Up")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color.secondary)
                    
                    HStack(spacing: 6) {
                        Text("Already have an account?")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color(hexString: "6C7278"))
                        
                        Text("Sign In")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.secondary)
                    }
                }
                
                // Form Container
                VStack(spacing: 24) {
                    // Input fields
                    VStack(spacing: 15) {
                        // First Name and Last Name (side by side)
                        HStack(spacing: 15) {
                            // First Name
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hexString: "EDF1F3"), lineWidth: 1)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                                TextField("First Name", text: $firstName)
                                    .padding(.horizontal, 10)
                            }
                            .frame(height: 46)
                            
                            // Last Name
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hexString: "EDF1F3"), lineWidth: 1)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                                TextField("Last Name", text: $lastName)
                                    .padding(.horizontal, 10)
                            }
                            .frame(height: 46)
                        }
                        
                        // Email
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "EDF1F3"), lineWidth: 1)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            TextField("Enter your email", text: $email)
                                .keyboardType(.emailAddress)
                                .padding(.horizontal, 10)
                        }
                        .frame(height: 46)
                        
                        // Index Number
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "EDF1F3"), lineWidth: 1)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            TextField("Index Number", text: $indexNumber)
                                .padding(.horizontal, 10)
                        }
                        .frame(height: 46)
                        
                        // Password
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "EDF1F3"), lineWidth: 1)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            HStack {
                                if showPassword {
                                    TextField("Password", text: $password)
                                        .padding(.leading, 10)
                                } else {
                                    SecureField("Password", text: $password)
                                        .padding(.leading, 10)
                                }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image("eye-off")
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 46)
                    }
                    
                    // Sign Up Button
                    Button(action: {
                        // Sign up action
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.secondary)
                            .cornerRadius(10)
                    }
                    
                    // Or login with
                    HStack {
                        Rectangle()
                            .fill(Color(hexString: "EDF1F3"))
                            .frame(height: 1)
                        
                        Text("Or login with")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hexString: "6C7278"))
                            .padding(.horizontal, 16)
                        
                        Rectangle()
                            .fill(Color(hexString: "EDF1F3"))
                            .frame(height: 1)
                    }
                    
                    // Google Button
                    Button(action: {
                        // Google login action
                    }) {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Text("Continue with Google")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hexString: "1A1C1E"))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "EFF0F6"), lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 30)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 24)
            }
            
            // Bottom shape overlay
            Image("Bottom")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.bottom)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 100)
        }
    }
}

// Preview provider
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}