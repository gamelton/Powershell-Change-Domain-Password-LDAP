$userSharedName = "test.shared.user1"
$userSharedPassword = "P@ssword1"
$userChangedName = "test.changed.user2"
$userChangedPassword = "P@ssword2"
$serverLDAP = "LDAP://dc.ad.domain.com:389/DC=ad,DC=domain,DC=com"
$DomainEntry = New-Object System.DirectoryServices.DirectoryEntry($serverLDAP, $userSharedName, $userSharedPassword)
$DomainName = $DomainEntry.name
$Searcher = New-Object -TypeName System.DirectoryServices.DirectorySearcher($DomainEntry)
$Searcher.Filter = "(&(objectClass=user)(sAMAccountName=$userChangedName))"
$FoundUser = $Searcher.FindOne().GetDirectoryEntry()
$FoundUser.Invoke("SetPassword", $userChangedPassword)
$FoundUser.CommitChanges()
$FoundUser.Close()
