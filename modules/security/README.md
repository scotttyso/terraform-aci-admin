# security - Global Password and Security Terraform Module - aci_rest

## Usage

```hcl
module "security" {

  source = "terraform-aci-access//modules/security"

  # omitted...
}
```

This module will Configure the Global Password and Security Parameters under Admin > AAA > Security.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "aaaUserEp"
  * subClass: "aaaPwdProfile"
  * subClass: "aaaBlockLoginProfile"
* Class: "pkiEp"
  * subClass: "pkiWebTokenData"
* Distinguished Name: "uni/userext"
* Distinguished Name: "uni/userext/blockloginp"
* Distinguished Name: "uni/userext/pwdprofile"
* Distinguished Name: "uni/userext/pkiext/webtokendata"
* GUI Location: Admin > AAA > Security

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation\_aaaBlock | Annotation for the Lockout Policy.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| annotation\_aaaPwd | Annotation for the Password Policy.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| lockout | A user who fails the login attempts too many times consecutively within a specified time period will become locked out for a specified time. The value can be:<br>  * enable: A user will be locked out for failing to log in successfully too many times.<br>  * disable: A user will not be locked out despite failing to log in.<br>The default is enable. | `string` | `"enable"` | no |
| lockout\_duration | The time period, in minutes, that a user will be locked out for having too many failed login attempts. The range is from 1 minutes to 1440 minutes. The default is 60 minutes. | `number` | `60` | no |
| lockout\_max\_failed\_attempts | The number failed login attempts a user has before being locked out if Lockout User after multiple failed login attempts is set to Enable. The range is from 1 to 15. The default is 5. | `number` | `5` | no |
| lockout\_time\_period | The time period, in minutes, during which consecutive failed login attempts are counted for lockout purposes. The range is from 1 minutes to 720 minutes. The default is 5 minutes. | `number` | `0` | no |
| pwd\_change\_count | The maximum number of times a locally authenticated user can change his or her password during the Change Interval. The range is from 0 to 10 changes. The default is 2. | `number` | `2` | no |
| pwd\_change\_interval | The maximum number of hours over which the number of password changes specified in the Change Interval field are enforced. The range is from 1 to 745 hours. The default is 48.<br><br>For example, if this field is set to 48 and the Change Interval field is set to 2, a locally authenticated user can make no more than 2 password changes within a 48 hour period. | `number` | `0` | no |
| pwd\_enforce\_interval | Restricts the number of password changes a locally authenticated user can make within a given number of hours. The value can be:<br>  * enable—The change interval policy is active.<br>  * disable—The change count policy is active.<br>The default is enable. | `string` | `"enable"` | no |
| pwd\_expiration\_warn | A warning period (days) before password expiration. A warning will be displayed when a user logs in within this number of days of an impending password expiration. Valid value is between 0 and 30 days.  Default is 15. | `number` | `15` | no |
| pwd\_history | The number of unique passwords that a locally authenticated user must create before that user can reuse a previously used password. The range is from 0 to 15. The default is 5. | `number` | `5` | no |
| pwd\_nochange\_interval | A minimum period after a password change before the user can change the password again.  The default is 24 hours | `number` | `24` | no |
| pwd\_strength\_check | Cisco recommends using a strong password enforcement. The default value is true. | `bool` | `true` | no |
| web\_idle\_timeout | The maximum amount of time that can elapse after the last refresh request before the APIC considers a web session as inactive. If this time limit is exceeded, the session is automatically terminated. The range is from 60 seconds to 65525 seconds. The default time is 1200 seconds. | `number` | `1200` | no |
| webtoken\_timeout | APIC uses web session limits to restrict the number of web sessions that a given user account is permitted to access at any one time. The range is from 300 seconds to 9600 seconds. The default is 600 seconds. | `number` | `600` | no |
| webtoken\_validity | The maximum number of concurrent web sessions allowed for each user. The default is 24 hours. | `number` | `24` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
