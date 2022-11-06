// Copyright 2021-present 650 Industries. All rights reserved.

import CoreGraphics
import ExpoModulesCore
import SwiftUI

public final class LinearGradientProps: ViewProps {
  @Field
  var colors: [UIColor] = []

  @Field
  var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0)

  @Field
  var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)

  @Field
  var locations: [CGFloat] = []
}

public class LinearGradientModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoLinearGradient")

    View { (props: LinearGradientProps) in
      ZStack {
        LinearGradient(
          colors: props.colors.map({ Color($0) }),
          startPoint: UnitPoint(x: props.startPoint.x, y: props.startPoint.y),
          endPoint: UnitPoint(x: props.endPoint.x, y: props.endPoint.y)
        )
        Text("SwiftUI in Expo 🔥")
          .font(.system(size: 30))
          .foregroundColor(.white)
      }
    }
//    ViewManager {
//      View {
//        LinearGradientView()
//      }
//
//      Prop("colors") { (view: LinearGradientView, colors: [CGColor]) in
//        view.gradientLayer.setColors(colors)
//      }
//
//      Prop("startPoint") { (view: LinearGradientView, startPoint: CGPoint?) in
//        view.gradientLayer.setStartPoint(startPoint)
//      }
//
//      Prop("endPoint") { (view: LinearGradientView, endPoint: CGPoint?) in
//        view.gradientLayer.setEndPoint(endPoint)
//      }
//
//      Prop("locations") { (view: LinearGradientView, locations: [CGFloat]?) in
//        view.gradientLayer.setLocations(locations)
//      }
//    }
  }
}
