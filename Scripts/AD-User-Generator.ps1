### Create new Active Directory user objects in order to speed the creation of lab environment

# Prompt for how many users objects to create
[int]$NumUsers = Read-Host "How many users would you like to create? [1-10]"
# Validate above input
if (($NumUsers -ge 1) -and ($NumUsers -le 10)) {break}
 else {Write-Host }



Do {[int]$NumUsers = Read-host "How many users would you like to create? [1-10]"}
while (($NumUsers -ge 1) -and ($NumUsers -le 10))




# Retrieve possible OUs

# Prompt user, interactively, for assignment to an OU

# Assign user object to interactively selected OU




# Retrieve possible Security Groups

# Prompt user, interactively, for assignment to a Security Group

# Assign user object to interactively selected Security Group



# Prompt for password asSecureString
$passwordSecureString = 

#Create ADUser object
New-ADUser -Name <string> -AccountPassword $passwordSecureString [-Surname <string>] [-SamAccountName <string>] [-UserPrincipalName <string>] [-Title <string>] [-Division <string>] [-City <string>] [-PostalCode <string>] [-Company <string>] [-OfficePhone <string>]
   <#[-WhatIf] [-Confirm] [-AccountExpirationDate <datetime>]
    [-AuthenticationPolicy <ADAuthenticationPolicy>] [-AuthType {Negotiate | Basic}] [-CannotChangePassword <bool>] [-Certificates <X509Certificate[]>] [-ChangePasswordAtLogon <bool>]      
    [-CompoundIdentitySupported <bool>] [-Country <string>] [-Credential <pscredential>] [-Department <string>] [-Description <string>] [-DisplayName <string>]      
     [-EmailAddress <string>] [-EmployeeID <string>] [-EmployeeNumber <string>] [-Enabled <bool>] [-Fax <string>] [-GivenName <string>]
    [-HomeDirectory <string>] [-HomeDrive <string>] [-HomePage <string>] [-HomePhone <string>] [-Initials <string>] [-Instance <ADUser>] [-KerberosEncryptionType    
    {None | DES | RC4 | AES128 | AES256}] [-LogonWorkstations <string>] [-Manager <ADUser>] [-MobilePhone <string>] [-Office <string>]      
    [-Organization <string>] [-OtherAttributes <hashtable>] [-OtherName <string>] [-PassThru] [-PasswordNeverExpires <bool>] [-PasswordNotRequired <bool>] [-Path    
    <string>] [-POBox <string>] [-PrincipalsAllowedToDelegateToAccount <ADPrincipal[]>] [-ProfilePath <string>]     
    [-ScriptPath <string>] [-Server <string>] [-ServicePrincipalNames <string[]>] [-SmartcardLogonRequired <bool>] [-State <string>] [-StreetAddress <string>]       
    [-Type <string>] #>

