# Powershell Profile:

- My own Powershell Profile!

## Changelog:

- 31/05/25

Removed some of the below functions and added start-reading-session function to profile. Also altered the profile paths to be compatible with Powershell 7+

- 05/07/23

Removed openmail function as never used it. Updated ghclonerepo with logic so it won't return the success message when no path or uri have been inputted

## Functions:

- `p`

Typing `p` will prompt for an IP address. This will then ping that IP and return whether it is reachable or not.

- `ghclonerepo`

This function allows you to clone any public GitHub repo into whatever location you input

- `updateprofile`

Running this will pull down the latest updates from this powershell profile repo's master branch

- `start-reading-session`

This function minimises all windows and opens up two youtube videos to play simultaneously to create a relaxing environment to read in.