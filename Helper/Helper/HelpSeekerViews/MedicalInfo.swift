//
//  MedicalInfo.swift
//  Helper
//
//  Created by Mai Thuỳ My on 11.4.2022.
//

import SwiftUI
import CoreData

struct MedicalInfo: View {
    @Binding var fullname: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var password: String
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack(alignment: .top) {
                        Image("BG Mask").edgesIgnoringSafeArea(.all)
                        Text("Medical information")
                            .fontWeight(.medium)
                            .frame(maxWidth: 300, alignment: .center)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                            .padding(.top, 50)
                    }
                    Spacer()
                    Text("By signup and login, I confirm I am at least  17 years old, and I agree to and accept  Helpers Terms & Privacy Policy")
                        .frame(maxWidth: 280)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))
                        .padding(.bottom, 30)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: 300, height: 500)
                        .shadow(radius: 5)
                    FormMedical(fullname: $fullname, email: $email, phone: $phone, password: $password)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MedicalInfo_Previews: PreviewProvider {
    static var previews: some View {
        MedicalInfo(fullname: .constant(""), email: .constant(""), phone: .constant(""), password: .constant(""))
    }
}

//struct SpecialNeed: View {
//    @State private var disabilitySelection = "None"
//    let specialNeeds = ["None", "Autism", "Down syndrome", "Blindness", "Deafness", "Immobilized", "ADHD"]
//
//    var body: some View {
//        Picker("Select need", selection: $disabilitySelection) {
//            ForEach(specialNeeds, id: \.self) {
//                Text($0)
//                    .frame(width: 110, height: 110)
//                    .background(.blue)
//            }
//        }
//        .pickerStyle(.menu)
//    }
//}
//
//struct ChronicDiseases: View {
//    @State private var diseaseSelection = "None"
//    let diseases = ["None", "Heart disease", "Stroke", "Cancer", "Depression", "Diabetes", "Arthritis", "Asthma", "Oral disease"]
//
//    var body: some View {
//        Picker("Select disease", selection: $diseaseSelection) {
//            ForEach(diseases, id: \.self) {
//                Text($0)
//                    .frame(width: 110, height: 110)
//                    .background(.blue)
//            }
//        }.pickerStyle(.menu)
//    }
//}
//
//
//struct Allergies: View {
//    @State private var allergySelection = "None"
//    let diseases = ["None", "Grass", "Pollen", "Dust mites", "Animal dander", "Nuts", "Gluten", "Lactose", "Mould"]
//
//    var body: some View {
//        Picker("Select disease", selection: $allergySelection) {
//            ForEach(diseases, id: \.self) {
//                Text($0)
//                    .frame(width: 110, height: 110)
//                    .background(.blue)
//            }
//        }
//        .pickerStyle(.menu)
//        .frame(alignment: .leading)
//    }
//}

struct FormMedical: View {
    @Binding var fullname: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var password: String
    
    
    @State var info: String = ""
    @State var isLinkActive = false
    @State var showAlert: Bool = false
    @State var signupFailed = false
    
    // set up environment
    @StateObject var userModel = UserViewModel()
    @Environment(\.managedObjectContext) var context
    
    // fetching data from core data
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.user_id, ascending: true)]) var results: FetchedResults<User>
    
    // set up medical info
    @State private var disabilitySelection = "None"
    let specialNeeds = ["None", "Autism", "Down syndrome", "Blindness", "Deafness", "Immobilized", "ADHD"]
    
    @State private var diseaseSelection = "None"
    let diseases = ["None", "Heart disease", "Stroke", "Cancer", "Depression", "Diabetes", "Arthritis", "Asthma", "Oral disease"]
    
    @State private var allergySelection = "None"
    let allergies = ["None", "Grass", "Pollen", "Dust mites", "Animal dander", "Nuts", "Gluten", "Lactose", "Mould"]
    
    func updateUser(username: String, password: String, email: String, phone: String, type: String, driving: String, coordinating: String, coaching: String, programing: String, often: String, age: Int, weight: Int, height: Int, need: String, cronic: String, allergies: String) {
        let user = User(context: context)
        user.user_id = (Int16) (results.count + 1)
        user.username = username.lowercased()
        user.password = password
        user.email = email.lowercased()
        user.phone = phone
        user.type = type.lowercased()
        user.driving = driving.lowercased()
        user.coordinating = coordinating.lowercased()
        user.coaching = coaching.lowercased()
        user.programing = programing.lowercased()
        user.often = often.lowercased()
        user.age = (Int16) (age)
        user.weight = (Int16) (weight)
        user.height = (Int16) (height)
        user.need = need.lowercased()
        user.cronic = cronic.lowercased()
        user.allergies = allergies.lowercased()
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                VStack {
                    Text("Special needs")
                        .fontWeight(.medium)
                        .frame(maxWidth: 300, alignment: .leading)
                        .font(.system(size: 16))
                    Picker("Select need", selection: $disabilitySelection) {
                        ForEach(specialNeeds, id: \.self) {
                            Text($0)
                                .frame(width: 110, height: 110)
                                .background(.blue)
                        }
                    }
                    .pickerStyle(.menu)
//                    SpecialNeed()
                    Text("Chronic diseases")
                        .fontWeight(.medium)
                        .frame(maxWidth: 300, alignment: .leading)
                        .font(.system(size: 16))
                        .padding(.top, 10)
                    Picker("Select disease", selection: $diseaseSelection) {
                        ForEach(diseases, id: \.self) {
                            Text($0)
                                .frame(width: 110, height: 110)
                                .background(.blue)
                        }
                    }.pickerStyle(.menu)
//                    ChronicDiseases()
                    Text("Allergies")
                        .fontWeight(.medium)
                        .frame(maxWidth: 300, alignment: .leading)
                        .font(.system(size: 16))
                        .padding(.top, 10)
                    Picker("Select disease", selection: $allergySelection) {
                        ForEach(allergies, id: \.self) {
                            Text($0)
                                .frame(width: 110, height: 110)
                                .background(.blue)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(alignment: .leading)
//                    Allergies()
                    Text("Others")
                        .fontWeight(.medium)
                        .frame(maxWidth: 300, alignment: .leading)
                        .font(.system(size: 16))
                        .padding(.top, 10)
                    TextField("\(results.count)", text: $info)
                        .padding(.bottom, 40)
                        .background(Color("Background"))
                        .cornerRadius(5)
                }
                .frame(width: 250)
                NavigationLink(destination: HelpSeekerNavBar().navigationBarHidden(true), isActive: self.$isLinkActive) { }
                Button(action: {
                    showAlert.toggle()
                }) {
                    Text("REGISTER")
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .frame(width: 100, height: 35)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.alert(isPresented: $showAlert, content: {
                    if self.signupFailed {
                        return Alert(title: Text("Register successfully!"),  dismissButton: .default(Text("Got it!"), action: {self.isLinkActive = false}))
                    } else {
                        updateUser(username: fullname, password: password, email: email, phone: phone, type: "h", driving: "", coordinating: "", coaching: "", programing: "", often: "", age: 25, weight: 50, height: 170, need: disabilitySelection, cronic: diseaseSelection, allergies: allergySelection)
                        return Alert(title: Text("Register successfully!"),  dismissButton: .default(Text("Got it!"), action: {self.isLinkActive = true}))
                    }
                })
                    .padding(.top, 40)
            }
            
        }
        
    }
}
