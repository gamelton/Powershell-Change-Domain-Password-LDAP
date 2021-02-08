# Powershell domain password change with LDAP  

First example scenario shows how to test password for domain user using LDAP  
Second example scenario shows how to reset password for domain user using LDAP  

Long version description scenario  
   Suppose a user lost his domain account password. He can't get in internal network. He needs to have his domain user account password reset.  
   The script is one way of doing it. It uses Powershell and LDAP connection. Note: it's security issue, the script holds clear text password, LDAP sends in clear text.  

The flow description

- User logins to domain as temporary test.shared.user1 account in Powershell

- User uses standalone machine not-joined to domain

- User changes password for his test.changed.user2 account


Test flow preparation  

1. Create domain user `test.shared.user1`  
   This is used for temporary login
  
1. Create domain user `test.changed.user2`  
   This is user's forgotten account
  
1. Grant access rights on `test.changed.user2`  
   Open Active Directory Users and Computers  
   Select View -> Checkbox Advanced features  
   Select `test.changed.user2` -> Properties 
   Go to Security -> Advanced -> Add  
   Select a principal -> `test.shared.user1`  
   Type -> Allow  
   Applies to -> This object only  
   Persmissions -> `Reset password`, `Change password`  
   Properties -> `Write lockoutTime`, `Write pwdLastSet`  
   Apply -> OK -> OK  


Test-LDAP-Credentials.ps1  

- Change `$userName = "test.changed.user2"`  
- Change `$userPassword = "P@ssword2"`  
- Chnage `$userDomain = "ad.domain.com"`  
- Change `$serverDC = "dc.ad.domain.com"`  
   After run script says True if password is correct  

Reset-LDAP-Password.ps1  

- Change `$userSharedName = "test.shared.user1"`  
- Change `$userSharedPassword = "P@ssword1"`  
- Change `$userChangedName = "test.changed.user2"`  
- Change `$userChangedPassword = "P@ssword2"`  
- Change `$serverLDAP = "LDAP://dc.ad.domain.com:389/DC=ad,DC=domain,DC=com"`  
   After run script user `test.changed.user2` has password P@ssword2  
