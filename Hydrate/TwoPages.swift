//
//  TwoPages.swift
//  Hydrate
//
//  Created by zainab hawsa on 09/08/1445 AH.
//

//
import SwiftUI

struct twoPages: View {
    @State private var currentPageIndex = 0

   var body: some View {
      
            TabView(selection: $currentPageIndex) {
                //Track(userWeight: 0.0)
                
                VStack {
                    CupsView()
                }
                .tabItem { EmptyView() }
                .tag(0)
                
                
                VStack {
                    Track(userWeight: 0.0)
                }
                .tabItem { EmptyView() }
                .tag(1)
                //Track()

              //  Onboarding2()
           }
           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
          .accentColor(.accent)
        
   }
}
 



#Preview {
    twoPages()
}
