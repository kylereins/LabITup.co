### Create new Active Directory user objects in order to speed the creation of lab environment
# https://adamtheautomator.com/new-aduser/
## Prompt for how many users objects to create
Do {[int]$NumUsers = Read-host "How many users would you like to create? [1-10]"}
Until (($NumUsers -ge 1) -and ($NumUsers -le 10))

foreach ($i in $NumUsers) {
    ## Retrieve possible OUs
    #Prompt user, interactively, for assignment to an OU
    If (Read-Host "Type 'Yes' to manually assign OU and Department. Otherwise, it will be Automatically selected." -eq "Yes") {
        $Department = Read-Host "What OU/Department?"     }
        else {$Department = $DepartmentNames[(Get-Random) % $DepartmentNames.Count]  #Gets Random Department Name from list below
    }

    #Assign user object to interactively selected OU

    ## Retrieve possible Security Groups
    # Prompt user, interactively, for assignment to a Security Group
    # Assign user object to interactively selected Security Group

    # Prompt for password asSecureString
    $passwordSecureString = Read-Host "What shall we set as the password?" -AsSecureString
    
    # Get random name from list of FirstNames and LastNames
    $FName = $FirstNames[(Get-Random -Maximum ($FirstNames.Count))]
    $LName = $LastNames[(Get-Random -Maximum ($LastNames.Count))]
    $Name = $FName + " " + $LName
        #Check $Name already exists (email/Name/etc.) in AD
        write-host "UserName being created will be: " $Name
    



        $Title = $Titles[((Get-Random) % $Titles.Count)] #Gets Random Title from list below
        write-host ("Title will be: " + $Title)
    $RandomNum = Get-Random -Maximum 4  #Sets random number for Office Phone field

    #Create ADUser object
    New-ADUser -Name $Name -GivenName $FName -Surname $LName -AccountPassword $passwordSecureString`
    [-SamAccountName <string>] [-UserPrincipalName <string>] -Enabled $True`
    -EmailAddress ($Name + "@labitup.co") -Title $Title -Department $Department [-Division <string>]`
    -City "Little Rock"  -PostalCode "72099" -Company "LabITup" -OfficePhone "(501)-123-'$RandomNum'" -State "AR"
    <#  Fields to consider setting...
        [-WhatIf] [-Confirm] [-AccountExpirationDate <datetime>] [-AuthenticationPolicy <ADAuthenticationPolicy>]
        [-AuthType {Negotiate | Basic}] [-CannotChangePassword <bool>] [-Certificates <X509Certificate[]>] [-ChangePasswordAtLogon <bool>] 
        [-CompoundIdentitySupported <bool>] [-Country <string>]  [-Description <string>] [-DisplayName <string>] [-EmployeeID <string>]
        [-EmployeeNumber <string>] [-Fax <string>] [-HomeDirectory <string>] [-HomeDrive <string>] [-HomePage <string>] 
        [-HomePhone <string>] [-Initials <string>] [-Instance <ADUser>] [-KerberosEncryptionType {None | DES | RC4 | AES128 | AES256}]
        [-LogonWorkstations <string>] [-Manager <ADUser>] [-MobilePhone <string>] [-Office <string>] [-Organization <string>]
        [-OtherAttributes <hashtable>] [-OtherName <string>] [-PassThru] [-PasswordNeverExpires <bool>] [-PasswordNotRequired <bool>]
        [-Path <string>] [-POBox <string>] [-PrincipalsAllowedToDelegateToAccount <ADPrincipal[]>] [-ProfilePath <string>] 
        [-ScriptPath <string>] [-Server <string>] [-ServicePrincipalNames <string[]>] [-SmartcardLogonRequired <bool>] [-StreetAddress <string>]
        [-Type <string>] #>

}


$FirstNames="James","Robert","John","Michael","David","William","Richard","Joseph","Thomas","Charles","Christopher","Daniel","Matthew",
"Anthony","Mark","Donald","Steven","Paul","Andrew","Joshua","Kenneth","Kevin","Brian","George","Timothy","Ronald","Edward","Jason","Jeffrey"
"Ryan","Jacob","Gary","Nicholas","Eric","Jonathan","Stephen","Larry","Justin","Scott","Brandon","Benjamin","Samuel","Gregory","Alexander",
"Frank","Patrick","Raymond","Jack","Dennis","Jerry","Tyler","Aaron","Jose","Adam","Nathan","Henry","Douglas","Zachary","Peter","Kyle","Ethan",
"Walter","Noah","Jeremy","Christian","Keith","Roger","Terry","Gerald","Harold","Sean","Austin","Carl","Arthur","Lawrence","Dylan","Jesse",
"Jordan","Bryan","Billy","Joe","Bruce","Gabriel","Logan","Albert","Willie","Alan","Juan","Wayne","Elijah","Randy","Roy","Vincent","Ralph",
"Eugene","Russell","Bobby","Mason","Philip","Louis","Mary","Patricia","Jennifer","Linda","Elizabeth","Barbara","Susan","Jessica","Sarah",
"Karen","Lisa","Nancy","Betty","Margaret","Sandra","Ashley","Kimberly","Emily","Donna","Michelle","Carol","Amanda","Dorothy","Melissa","Deborah",
"Stephanie","Rebecca","Sharon","Laura","Cynthia","Kathleen","Amy","Angela","Shirley","Anna","Brenda","Pamela","Emma","Nicole","Helen","Samantha",
"Katherine","Christine","Debra","Rachel","Carolyn","Janet","Catherine","Maria","Heather","Diane","Ruth","Julie","Olivia","Joyce","Virginia",
"Victoria","Kelly","Lauren","Christina","Joan","Evelyn","Judith","Megan","Andrea","Cheryl","Hannah","Jacqueline","Martha","Gloria","Teresa",
"Ann","Sara","Madison","Frances","Kathryn","Janice","Jean","Abigail","Alice","Julia","Judy","Sophia","Grace","Denise","Amber","Doris","Marilyn",
"Danielle","Beverly","Isabella","Theresa","Diana","Natalie","Brittany","Charlotte","Marie","Kayla","Alexis","Lori"

$DepartmentNames = "BOD","Engineering","Finance","HR","IT","Legal","Purchasing","Marketing","Operations","Sales"

$Titles = "Manager","Worker","Laborer","Doer of Things","Collator","Party planning committee","Assistant Regional Manager"




