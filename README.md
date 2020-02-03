# WSUS-Scheduler
Pick updates now and approve them later. Useful for low bandwidth locations where approving during business hours could be catastrophic.

Powershell script that I'm just messing with at this point. The idea is that the admin (in this case me) is lazy and doesn't want to remote in later to approve updates.

1. Edit the top lines of both scripts for your institution

2. Run Select-WSUSToSchedule to pick the updates that you want to approve later. I've chosen to select updates that have been Approved and are Failed or Needed. That works in our environment because we approve for test groups first. If you want to use this script for brand new updates, change that line of code from Approved to Unapproved.

3. Create a scheduled task to run Approve-WSUSUpdates after hours

Work in progress... More to come...

[![CodeFactor](https://www.codefactor.io/repository/github/compuvin/wsus-scheduler/badge)](https://www.codefactor.io/repository/github/compuvin/wsus-scheduler)
