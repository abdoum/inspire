//
//  QuickSignInWithApple.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI
import AuthenticationServices


struct QuickSignInWithApple: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton(type: .signIn, style: colorScheme == .dark ? .white : .black)
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}

struct SignInWithApple: View {
  var body: some View {
      QuickSignInWithApple()
        .clipShape(Capsule())
        .frame(width: 350, height: 50, alignment: .center)
        .onTapGesture(perform: showAppleLoginView)
  }
  
  private func showAppleLoginView() {
     print("ShowAppleLoginView")
  }
}

struct QuickSignInWithApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple()
    }
}
