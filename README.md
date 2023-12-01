# Azure AD Connect - Catches
- Azure AD Connect is a Microsoft tool designed to synchronize on-premises Active Directory (AD) identities with Azure Active Directory (Azure AD). This synchronization enables a single identity to be used for accessing both on-premises and cloud-based resources, providing a more seamless and integrated experience for users.
- **Given some catches on Azure AD connect those will be useful during troubleshooting & Sync issue**.

### Active Mode vs. Stagging Mode
- Active Mode - Import, Export & Synchronization.
- Stagging Mode - Import & Synchronization.

### Source Anchor/mS-DS-ConsistencyGuid
- '**mS-DS-ConsistencyGuid**' AD attribute is synced with Azure AD user's '**ImmutableId**'.
- Traslate_ImmutableId.ps1 [Source](https://blog.jumlin.com/2018/09/powershell-script-convert-immutableid/)
- [Deepdive](https://www.youtube.com/watch?v=e9f0VXNqCuY)

####

```powershell
# Get ImmutableId
# Install-Module MSOnline -Force -Verbose 
$Msolcred = Get-credential
Connect-MsolService -Credential $Msolcred
Get-MsolUser -UserPrincipalName bbiswas-a@bshwjt.com | Select ImmutableId

# Get mS-DS-ConsistencyGuid
Get-ADUser bbiswas-a -pr * | Select mS-DS-ConsistencyGuid
```
