//
//  SignInWithAppleViewModel.swift
//  inspire
//
//  Created by Jonathan Duong on 17/06/2021.
//

import Foundation
import AuthenticationServices

class SignInWithAppleViewModel: NSObject, ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController,
                               didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
      case let appleIdCredential as ASAuthorizationAppleIDCredential:
        if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
          // Apple has autherized the use with Apple ID and password
          registerNewUser(credential: appleIdCredential)
        } else {
          // User has been already exist with Apple Identity Provider
          signInExistingUser(credential: appleIdCredential)
        }
        break
        
      case let passwordCredential as ASPasswordCredential:
        print("\n ** ASPasswordCredential ** \n")
        signinWithUserNamePassword(credential: passwordCredential)
        break
        
      default:
        break
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    print("\n -- ASAuthorizationControllerDelegate -\(#function) -- \n")
    print(error)
    // Give Call Back to UI
  }
}

extension SignInWithAppleViewModel {
  private func registerNewUser(credential: ASAuthorizationAppleIDCredential) {
    // API Call - Pass the email, user full name, user identity provided by Apple and other details.
    // Give Call Back to UI
  }
  
  private func signInExistingUser(credential: ASAuthorizationAppleIDCredential) {
    // API Call - Pass the user identity, authorizationCode and identity token
    // Give Call Back to UI
  }
  
  private func signinWithUserNamePassword(credential: ASPasswordCredential) {
    // API Call - Sign in with Username and password
    // Give Call Back to UI
  }
}
