//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Melih Yuvacı on 25.08.2022.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    
    private var service : NetworkService
    init(service : NetworkService){
        self.service = service
    }
    
    func downloadUser() async{
        
        var resource = ""
        
        if service.type == "Webservice" {
            resource = Constant.Urls.usersExtension
        }else {
            resource = Constant.Paths.baseUrl
        }
        
        do {
            let users = try await  service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error)
        }
       
    }
    
}


struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String{
        user.username
    }
    
    var email : String {
        user.email
    }
}
