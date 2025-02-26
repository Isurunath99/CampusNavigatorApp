//
//  LoginView.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/25/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = "mahel@gmail.com"
    @State private var password: String = "*******"
    @State private var showPassword: Bool = false
    @State private var rememberMe: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 20)
                
                // Title and subtitle
                VStack(spacing: 8) {
                    Text("Sign in to your Account")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(6)
                        .kerning(-0.64)
                    
                    Text("Enter your email and password to log in")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .kerning(-0.12)
                }
                .frame(width: UIScreen.main.bounds.width * 0.85)
                
                // Form container
                VStack(spacing: 24) {
                    // Google button
                    Button(action: {
                        // Google sign in action
                    }) {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 18, height: 18)
                            
                            Text("Continue with Google")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.darkGray)
                                .kerning(-0.14)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "#EFF0F6"), lineWidth: 1)
                        )
                    }
                    
                    // Or login with
                    HStack {
                        Rectangle()
                            .fill(Color(hexString: "#EDF1F3"))
                            .frame(height: 1)
                        
                        Text("Or login with")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hexString: "#6C7278"))
                            .kerning(-0.12)
                            .padding(.horizontal, 16)
                        
                        Rectangle()
                            .fill(Color(hexString: "#EDF1F3"))
                            .frame(height: 1)
                    }
                    
                    // Input fields
                    VStack(spacing: 15) {
                        // Email field
                        HStack {
                            TextField("Enter your email", text: $email)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                            
                            Spacer()
                        }
                        .frame(height: 46)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "#EDF1F3"), lineWidth: 1)
                        )
                        
                        // Password field
                        HStack {
                            if showPassword {
                                TextField("Password", text: $password)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 10)
                            } else {
                                SecureField("Password", text: $password)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 10)
                            }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(showPassword ? "eye" : "eye-off")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 46)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hexString: "#EDF1F3"), lineWidth: 1)
                        )
                        
                        // Remember me and forgot password
                        HStack {
                            Button(action: {
                                rememberMe.toggle()
                            }) {
                                HStack(spacing: 5) {
                                    Image(rememberMe ? "remeber-check" : "checkbox-empty")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                    
                                    Text("Remember me")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(Color(hexString: "#6C7278"))
                                        .kerning(-0.12)
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Forgot password action
                            }) {
                                Text("Forgot Password ?")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.secondary)
                                    .kerning(-0.12)
                            }
                        }
                    }
                    
                    // Login button
                    Button(action: {
                        // Login action
                    }) {
                        Text("Log In")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .kerning(-0.14)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.secondary)
                            .cornerRadius(10)
                    }
                    
                    // Sign up
                    HStack(spacing: 6) {
                        Text("Don't have an account?")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color(hexString: "#6C7278"))
                            .kerning(-0.12)
                        
                        Button(action: {
                            // Sign up action
                        }) {
                            Text("Sign Up")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.secondary)
                                .kerning(-0.12)
                        }
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 24)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                .padding(.top, 26)
                .frame(width: UIScreen.main.bounds.width * 0.85)
                
                Spacer()
            }
            
            // Bottom shape image
            VStack {
                Spacer()
                Image("Bottom")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
