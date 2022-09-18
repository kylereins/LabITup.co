### Create new Active Directory user objects in order to speed the creation of lab environment
# https://adamtheautomator.com/new-aduser/
# https://adamtheautomator.com/powershell-whatif/

## Prompt for how many users objects to create
Do {[int]$NumUsers = Read-host "How many users would you like to create? [1-10]"}
Until (($NumUsers -ge 1) -and ($NumUsers -le 10))

## Prompt for -Whatif in order to a dry run (doesn't actually run commands)
$DoWhatIf = $false
#$DoWhatIf = Read-Host "Would you like to do a Dry-Run (makes no changes)?"
    Write-Host "The DoWhatIf variable is set to $DoWhatIf"

$Domain = "labitup.co"
#Need to change Domain variable in to DomainLDAP variable
$DomainLDAP = "DC=labitup,DC=co" #Future development: confirm with user this is the right domain name

# Prompt for password asSecureString
$AccountPassword = Read-Host "We are going to set passwords for all accounts created in this run as the same password, `
What shall we set as the password(s) as?" -AsSecureString

for ($i=1; $i -le $NumUsers; $i++) {
    $Department = Get-Random -InputObject $DepartmentNames  #Gets Random Department Name from list below
        write-host "Department will be: " $Department
    #Check if Department exists in AD as an OU, and create OU if not 
    $OU = $Department
        write-host "OU will be: " $OU
    if (Get-ADOrganizationalUnit -Filter "distinguishedName -eq 'OU=$Department,$DomainLDAP'") {
        Write-Host "OU $Department already exists in $DomainLDAP" #if OU exists do this...
    } else { Write-Host "We will have to create the OU: $Department" #Establish new OU
        New-ADOrganizationalUnit -WhatIf:$DoWhatIf -Name $Department -Path $DomainLDAP
        }
    write-host "results of Get-ADOrgUnit is: " Get-ADOrganizationalUnit -Identity "OU=$Department,DC=labitup,DC=co"
    $Path = "OU=$OU,DC=labitup,DC=co"
        Write-Host "Path will be: " $Path

    ## Retrieve possible Security Groups
    # Prompt user, interactively, for assignment to a Security Group
    # Assign user object to interactively selected Security Group

    # Get random name from list of FirstNames and LastNames below
    $FName = Get-Random -InputObject $FirstNames
    $LName = Get-Random -InputObject $LastNames
    $Name = $FName + $LName
    #$Name = $FName + " " + $LName
        #Check $Name already exists (email/Name/etc.) in AD.  SamAccountName is 
        write-host "Name will be: " $Name
        #get-aduser ($FName + $LName) -eq $
    
    $Title = Get-Random -InputObject $Titles #Gets Random Title from list below
        write-host "Title will be: " $Title

    $OfficePhoneExt = (Get-Random -Maximum 9999 | Out-String)  #Sets random number for Office Phone field
     $OfficePhoneExt = $OfficePhoneExt.PadLeft(4,'0')
        write-host '$OfficePhoneExt will be: ' $OfficePhoneExt

    #Create ADUser object
    New-ADUser -WhatIf:$DoWhatIf -Name $Name -GivenName $FName -Surname $LName `
    -UserPrincipalName "$Name@$Domain" -AccountPassword $AccountPassword `
    -Path $Path -OfficePhone "(501)-123-$OfficePhoneExt" -Enabled $True `
    -EmailAddress ($Name + "@labitup.co") -Title $Title -Department $Department `
    -City "Little Rock"  -PostalCode "72099" -Company "LabITup" -State "AR" #Static/Rubber-Stamped values
    <#  Fields to consider setting...
        [-SamAccountName <string>] [-Division <string>]
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

[System.Collections.ArrayList]$FirstNames="James","Robert","John","Michael","David","William","Richard","Joseph","Thomas","Charles","Christopher","Daniel","Matthew",
"Anthony","Mark","Donald","Steven","Paul","Andrew","Joshua","Kenneth","Kevin","Brian","George","Timothy","Ronald","Edward","Jason","Jeffrey",
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

[System.Collections.ArrayList]$LastNames = "Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez",
"Hernandez","Lopez","Gonzales","Wilson","Anderson","Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White","Harris",
"Sanchez","Clark","Ramirez","Lewis","Robinson","Walker","Young","Allen","King","Wright","Scott","Torres","Nguyen","Hill","Flores","Green",
"Adams","Nelson","Baker","Hall","Rivera","Campbell","Mitchell","Carter","Roberts","Gomez","Phillips","Evans","Turner","Diaz","Parker","Cruz",
"Edwards","Collins","Reyes","Stewart","Morris","Morales","Murphy","Cook","Rogers","Gutierrez","Ortiz","Morgan","Cooper","Peterson","Bailey",
"Reed","Kelly","Howard","Ramos","Kim","Cox","Ward","Richardson","Watson","Brooks","Chavez","Wood","James","Bennet","Gray","Mendoza","Ruiz",
"Hughes","Price","Alvarez","Castillo","Sanders","Patel","Myers","Long","Ross","Foster","Jimenez"

[System.Collections.ArrayList]$DepartmentNames = "BOD","Engineering","Finance","HR","IT","Legal","Purchasing","Marketing","Operations","Sales"

[System.Collections.ArrayList]$Titles = "Manager","Worker","Laborer","Doer of Things","Collator","Party planning committee","Assistant Regional Manager"



