//
//  SignInViewController.swift
//  FYP
//
//  Created by Armani on 16/02/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit
import Firebase
import WebKit



class SignInViewController: UIViewController , WKNavigationDelegate {
    
    var webView: WKWebView!
    var URLString = String()
    var test = 0
    var code = String()
    var accessToken = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadGitHubSignIn() {
        let url = URL(string: "https://github.com/login/oauth/authorize?client_id=acde29e2a04f03923cfe")
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        webView.load(URLRequest(url: url!))
        sendHTTPrequest()
    }
    
    func sendHTTPrequest() {
        let getURLrequest = "https://github.com/login/oauth/authorize?client_id=acde29e2a04f03923cfe"
        guard let url = URL(string: getURLrequest) else {
            print("URL was invalid!")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        //Create the URL session!
        let UrlConfig = URLSessionConfiguration.default
        let UrlSession = URLSession(configuration: UrlConfig)
        
        //Actually make the request!
        let task = UrlSession.dataTask(with: urlRequest) {
            (data, response, error) in
            
            //Check for a response
            if let response = response {
                print(response)
            }
            
            //Check for the errors we may encounter
            guard error == nil else {
                print("bumped into an error on the way!")
                return
            }
            
            //Check if we actually got anything back
            guard let responseData = data else {
                print("We didn't get any data back!")
                return
            }
            
            
            //Parse the JSON returned for me
            do {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String : Any] else {
                    print("error trying to convert data to JSON")
                    return
                }
                print(json)
            } catch {
                print("Error could not get any JSON from the call!")
                return
            }
        }
        //Resume the task
        task.resume()
    }
    
    
    
    func postRequest() {
        //Create our parameters to send to GitHub [Client_ID|Client_Secret|Code]
        let parameters = ["client_id" : "acde29e2a04f03923cfe" , "client_secret" : "ef8814f7cc5c348a42b9a79a94184b4ccfdd9e5f", "code" : code ]
        
        guard let url = URL(string: "https://github.com/login/oauth/access_token") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        
        //Create the session!
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error)
            in
            if let response = response {
                let responseData = String(data: data!, encoding: String.Encoding.utf8)
                print("Here is the response: \(responseData)")
                //Save our accessToken for later use!
                self.accessToken = responseData!
                self.accessToken = self.getAccessToken(accessToken: self.accessToken)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                } catch {
                    // print(error)
                }
            }
            
            let credential = GitHubAuthProvider.credential(withToken: self.accessToken)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print(error)
                    return
                } else {
                    //We have logged in successfully
                }
                
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "repoView") as! RepositoryTableViewController
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
            }.resume() 
    }
    
    func getCodeURL(urlString: String) -> String{
        //Replace the callBackurl with empty string to get the code!
        let codeString = urlString.replacingOccurrences(of: "https://technical-debt.firebaseapp.com/__/auth/handler?code=", with: "")
        return codeString
    }
    
    func getAccessToken(accessToken: String) -> String {
        let start = accessToken.index(accessToken.startIndex, offsetBy: 13)
        let end = accessToken.index(accessToken.endIndex, offsetBy: -25)
        let range = start..<end
        
        let newAccessToken = String(accessToken[range])
        print("this is the access Token \(newAccessToken)")
        return newAccessToken
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString{
            //Get the code GitHub sends us and store it as an object for POST request!
            print("The url is \(urlString)")
            //Increment this variable to check if we are at the right URL
            test += 1
            if test == 2 {
                //Get the access code from the url!
                code = getCodeURL(urlString: urlString)
                postRequest()
            }
        }
    }
    
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("WE HAVE BEEN REDIRECTED")
    }
    
    
    
    @IBAction func signInTapped(_ sender: Any) {
        loadGitHubSignIn()
    }
}


