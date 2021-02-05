$userName = "test.changed.user2"
$userPassword = "P@ssword2"
$userDomain = "ad.domain.com"
$serverDC = "dc.ad.domain.com"
Add-Type -AssemblyName System.DirectoryServices.AccountManagement
$ContextType = [System.DirectoryServices.AccountManagement.ContextType]::Domain
$PrincipalContext = [System.DirectoryServices.AccountManagement.PrincipalContext]::new($ContextType, $userDomain, $serverDC)
$PrincipalContext.ValidateCredentials($userName,$userPassword)
