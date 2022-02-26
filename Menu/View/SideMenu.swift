//
//  SideMenu.swift
//  Menu
//
//  Created by ayhan on 25.02.2022.
//

import SwiftUI

struct SideMenu: View {
  @Binding var currentTab: String

  @Namespace var animation

    var body: some View {
      VStack{

        HStack(spacing: 15){
          Image("Pic")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 45, height: 45)
            .clipShape(Circle())

          Text("Account")
            .font(.title2.bold())
            .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)

        ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {

          VStack(alignment: .leading, spacing: 25){

            customTabButton(icon: "theatermasks.fill", title: "Home")

            customTabButton(icon: "safari.fill", title: "Discover")

            customTabButton(icon: "applewatch", title: "Devices")

            customTabButton(icon: "person.fill", title: "Profile")

            customTabButton(icon: "gear", title: "Setting")

            customTabButton(icon: "info.circle.fill", title: "About")

            customTabButton(icon: "questionmark.circle.fill", title: "Help")

            Spacer()

            customTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
          }
          .padding()
          .padding(.top, 45)

        })
        .frame(width: getRect().width / 2, alignment: .leading)
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding(.leading, 10)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .background(
        Color("BG")
      )
    }
  @ViewBuilder
  func customTabButton(icon: String, title: String)-> some View{
    Button{

      if title == "Logout"{
        print("Logout")
      }
      else{
        withAnimation {
          currentTab = title
        }
      }

    }label: {

      HStack(spacing: 12){

        Image(systemName: icon)
          .font(.title3)
          .frame(width: currentTab == title ? 48 : nil, height: 48)
          .foregroundColor(Color("P"))
          .background(

            ZStack{
              if currentTab == title{
                Color("BG")
                  .clipShape(Circle())
                  .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
              }
            }
          )
        Text(title)
          .font(.callout)
          .fontWeight(.semibold)
          .foregroundColor(currentTab == title ? Color("Gray") : .white)
      }
      .padding(.trailing, 18)
      .background(
        ZStack{
          if currentTab == title{
            Color("P")
              .clipShape(Capsule())
              .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
          }
        }
      )
    }
    .offset(x: currentTab == title ? 15 : 0)
  }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
  func getRect()->CGRect{
    return UIScreen.main.bounds
  }
}
