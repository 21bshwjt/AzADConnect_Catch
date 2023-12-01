# Azure AD Connect - Catches

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
