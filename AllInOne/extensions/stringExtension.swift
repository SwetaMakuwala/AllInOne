//
//  Extensions.swift
//  AllInOne
//
//  Created by sweta makuwala on 02/07/22.
//reference of validation: https://stackoverflow.com/questions/39284607/how-to-implement-a-regex-for-password-validation-in-swift

import Foundation

extension String {
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isValidPassword: Bool {
        let passRegEx =  "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passwordTest.evaluate(with: self)
    /*
     ^                         Start anchor
     (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
     (?=.*[!@#$&*])            Ensure string has one special case letter.
     (?=.*[0-9].*[0-9])        Ensure string has two digits.
     (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
     .{8}                      Ensure string is of length 8.
     $                         End anchor.
     Minimum 8 characters at least 1 Alphabet and 1 Number:

     "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
     Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:

     "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
     Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:

     "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
     Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:

     "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
     Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:

     "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
     */
        
    }
    var isValidPhoneNum : Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
