//
//  AppAddButtonView.swift
//  HMH_iOS
//
//  Created by 지희의 MAC on 1/8/24.
//

import SwiftUI
import UIKit
import FamilyControls
import DeviceActivity

//class AppAddButtonViewModel: ObservableObject {
//    @Published var newSerlection: FamilyActivitySelection
//
//    init(newSelection: FamilyActivitySelection) {
//        self.newSelection = newSelection
//    }
//}

struct AppAddButtonView: View {
    
    @EnvironmentObject var model: BlockingApplicationModel
    var appGroupData: [String] = []
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .clear)
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(uiColor: .gray8))
            Button(action: { isPresented.toggle() }) {
                Image(uiImage: ImageLiterals.Challenge.icPlus)
            }
            .frame(width: 335, height: 68)
            .familyActivityPicker(isPresented: $isPresented, selection: $model.newSelection)
            .onChange(of: isPresented)  { oldValue, newValue in
                if newValue == false {
                    let app = model.selectedApps.forEach {
                        print($0.bundleIdentifier?.utf8)
                    }
                    let appTokens: () = model.selectedAppsTokens.forEach {
                        print($0)
                    }
                    let mainViewController = TabBarController()
                    let navigationController = UINavigationController(rootViewController: mainViewController)
                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    guard let delegate = sceneDelegate else {
                        return
                    }
                    delegate.window?.rootViewController = navigationController
                    navigationController.pushViewController(GoalTimeSelectViewController(), animated: true)
                }
            }
            
        }
        .background(Color(.clear))
    }
    
    func storeMonitor() {
        
    }
}

#Preview {
    AppAddButtonView()
        .environmentObject(BlockingApplicationModel.shared)
}
