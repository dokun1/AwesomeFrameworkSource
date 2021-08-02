//
//  AwesomeButton.swift
//  AwesomeFramework
//
//  Created by David Okun on 7/30/21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(Color.blue)
      )
      .scaleEffect(configuration.isPressed ? 0.8: 1)
      .foregroundColor(.white)
      .animation(.spring(), value: 1)
  }
}

/// A button with some cool effects!
public struct AwesomeButton: View {
  /// This is the title for the button.
  public var title: String
  /// This is the closure for what the button does.
  public var action: () -> Void
  /// This is the body for the button - don't override this.
  
  public init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Text(title)
        .padding()
    }.buttonStyle(PrimaryButtonStyle())
  }
}

struct AwesomeButton_Previews: PreviewProvider {
  static var previews: some View {
    AwesomeButton(title: "I'm awesome!") {
      print("yep, this button is awesome")
    }
  }
}
