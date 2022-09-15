### Create new Active Directory user objects in order to speed the creation of lab environment
# https://adamtheautomator.com/new-aduser/
## Prompt for how many users objects to create
Do {[int]$NumUsers = Read-host "How many users would you like to create? [1-10]"}
Until (($NumUsers -ge 1) -and ($NumUsers -le 10))

foreach ($i in $NumUsers) {
    ## Retrieve possible OUs
    #Prompt user, interactively, for assignment to an OU
    <#If (Read-Host "Type 'Yes' to manually assign OU and Department. Otherwise, it will be Automatically selected." -eq "Yes") {
        $Department = Read-Host "What OU/Department?"     }
        else {$Department = $DepartmentNames[(Get-Random) % $DepartmentNames.Count]  #Gets Random Department Name from list below
    }#>
    $Department = $DepartmentNames[(Get-Random) % $DepartmentNames.Count]  #Gets Random Department Name from list below
        write-host "Department is: " + $Department

    ## Retrieve possible Security Groups
    # Prompt user, interactively, for assignment to a Security Group
    # Assign user object to interactively selected Security Group

    # Prompt for password asSecureString
    $AccountPassword = Read-Host "What shall we set as the password?" -AsSecureString
    
    # Get random name from list of FirstNames and LastNames below
    $FName = $FirstNames[(Get-Random -Maximum ($FirstNames.Count))]
    $LName = $LastNames[(Get-Random -Maximum ($LastNames.Count))]
    $Name = $FName + " " + $LName
        #Check $Name already exists (email/Name/etc.) in AD.  SamAccountName is 
        write-host "UserName being created will be: " $Name
        get-aduser ($FName + $LName) -eq $
    
    #Select Random OU, and check if OU exists in AD
    $OU = $DepartmentNames[(Get-Random -Maximum ($DepartmentNames.Count))]
        #Check is OU exists... else...
    $Path = "OU='$OU'DC=labitup,DC=co"

    $Title = $Titles[((Get-Random) % $Titles.Count)] #Gets Random Title from list below
        write-host ("Title will be: " + $Title)

    $OfficePhoneExt = Get-Random -Maximum 4  #Sets random number for Office Phone field

    #Create ADUser object
    New-ADUser -Name $Name -GivenName $FName -Surname $LName -AccountPassword $AccountPassword`
    -Path $Path` #OU placement
    -OfficePhone "(501)-123-'$OfficePhoneExt'" -Enabled $True`
    -EmailAddress ($Name + "@labitup.co") -Title $Title -Department $Department [-Division <string>]` #Static/Rubber-Stamped values
    -City "Little Rock"  -PostalCode "72099" -Company "LabITup" -State "AR" #Static/Rubber-Stamped values
    <#  Fields to consider setting...
        [-SamAccountName <string>] [-UserPrincipalName <string>]
        [-WhatIf] [-Confirm] [-AccountExpirationDate <datetime>] [-AuthenticationPolicy <ADAuthenticationPolicy>]
        [-AuthType {Negotiate | Basic}] [-CannotChangePassword <bool>] [-Certificates <X509Certificate[]>] [-ChangePasswordAtLogon <bool>] 
        [-CompoundIdentitySupported <bool>] [-Country <string>]  [-Description <string>] [-DisplayName <string>] [-EmployeeID <string>]
        [-EmployeeNumber <string>] [-Fax <string>] [-HomeDirectory <string>] [-HomeDrive <string>] [-HomePage <string>] 
        [-HomePhone <string>] [-Initials <string>] [-Instance <ADUser>] [-KerberosEncryptionType {None | DES | RC4 | AES128 | AES256}]
        [-LogonWorkstations <string>] [-Manager <ADUser>] [-MobilePhone <string>] [-Office <string>] [-Organization <string>]
        [-OtherAttributes <hashtable>] [-OtherName <string>] [-PassThru] [-PasswordNeverExpires <bool>] [-PasswordNotRequired <bool>]
        [-POBox <string>] [-PrincipalsAllowedToDelegateToAccount <ADPrincipal[]>] [-ProfilePath <string>] 
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

$LastNames = "Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez","Hernandez","Lopez","Gonzales","Wilson","Anderso
n","Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White","Harris","Sanchez","Clark","Ramirez","Lewis","Robinson","Wal
ker","Young","Allen","King","Wright","Scott","Torres","Nguyen","Hill","Flores","Green","Adams","Nelson","Baker","Hall","Rivera","Campbell","M
itchell","Carter","Roberts","Gomez","Phillips","Evans","Turner","Diaz","Parker","Cruz","Edwards","Collins","Reyes","Stewart","Morris","Morale
s","Murphy","Cook","Rogers","Gutierrez","Ortiz","Morgan","Cooper","Peterson","Bailey","Reed","Kelly","Howard","Ramos","Kim","Cox","Ward","Ric
hardson","Watson","Brooks","Chavez","Wood","James","Bennet","Gray","Mendoza","Ruiz","Hughes","Price","Alvarez","Castillo","Sanders","Patel","
Myers","Long","Ross","Foster","Jimenez"

$DepartmentNames = "BOD","Engineering","Finance","HR","IT","Legal","Purchasing","Marketing","Operations","Sales"

$Titles = "Manager","Worker","Laborer","Doer of Things","Collator","Party planning committee","Assistant Regional Manager"




