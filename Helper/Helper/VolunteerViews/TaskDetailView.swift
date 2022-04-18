//
//  TaskDetailView.swift
//  Helper
//
//  Created by Annie Huynh on 7.4.2022.
//


import SwiftUI

struct TaskDetailView: View {
    
    var body: some View {
        GeometryReader {geometry in
            ZStack{
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        ZStack {
                            VStack{
                                ContactInfo()
                                Divider()
                                DisabilityInformation()
                            }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.45)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        VStack(alignment: .leading, spacing: 8){
                            TaskTitle()
                            Address()
                            TimeNeeded()
                            TaskDescription()
                            Attachment()
                        }.padding(.horizontal)
                    }
                }
                    
            }
        }
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
    }
}

struct DisabilityInformation: View {
    var body: some View {
        VStack(spacing:10){
            HStack(spacing:-10) {
                Text("Diability :")
                    .font(.body)
                    .bold()
                    .foregroundColor(.black)
                
                
                Text("wheelchair")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                Spacer()
            }
            
            HStack(spacing:-10) {
                Text("Chornic disease :")
                    .font(.body)
                    .bold()
                    .foregroundColor(.black)
                Text("heart disease")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                Spacer()
            }
            HStack(spacing:-10) {
                Text("Allergies :")
                    .font(.body)
                    .bold()
                    .foregroundColor(.black)
                Text("Pollen, animal fur")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                Spacer()
            }
        }
        .padding(.vertical)
        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct ContactInfo: View {
    var body: some View {
        VStack(spacing:0) {
            Image("avatar")
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(50)
                .padding(.top, 20)
            
            Text("Help seeker name")
                .bold()
                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            HStack(spacing:30) {
                VStack(spacing:15) {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Call")
                        .padding(.top, -10)
                }
                
                VStack(spacing:15) {
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Message")
                        .padding(.top, -10)
                }
            }
        }.padding(.top,0)
    }
}

struct TaskTitle: View {
    var body: some View {
        Text("Title")
            .bold()
            .font(.title2)
            .foregroundColor(Color("Primary"))
        Text("Grocery Shopping")
        
        Divider()
    }
}

struct Address: View {
    var body: some View {
        Text("Address")
            .bold()
            .font(.title2)
            .foregroundColor(Color("Primary"))
        Text("Runeberginkatu 55, 00260 Helsinki")
        Divider()
    }
}

struct TimeNeeded: View {
    var body: some View {
        Text("Time Needed")
            .bold()
            .font(.title2)
            .foregroundColor(Color("Primary"))
        Text("Runeberginkatu 55, 00260 Helsinki")
        Divider()
    }
}

struct TaskDescription: View {
    var body: some View {
        Text("Description")
            .bold()
            .font(.title2)
            .foregroundColor(Color("Primary"))
        Text("I need help picking up some items at the store while my personal assistant is on sick leave.\nLeave at front door. Entrance code B1234.")
        Divider()
    }
}

struct Attachment: View {
    var body: some View {
        Text("Attached file")
            .bold()
            .font(.title2)
            .foregroundColor(Color("Primary"))
        Label("1 attached file", systemImage: "paperclip")
        Text("See image or file sent by help seeker")
            .bold()
            .foregroundColor(Color("Primary"))
    }
}
