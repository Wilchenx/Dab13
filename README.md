# Dabber Station 13 - Space Station 13 Server
Active build for Dab13 codebase, what is dab13?
Dab13 is a space station 13 server, which is funny. or maybe not.
https://discord.gg/gAuEREJ is our discord.

# I get a lot of errors when compiling mostly about "dmi files"
In dream maker go to build > preferences for dabberstation and tick "automatically set FILE_DIR for sub directories"

# Setup (For server hosts)
Download this repo as a zip.

Compile using Dream Maker, you can also do Compile And Run if you want to do a testrun of how your server's gonna play. If you're gonna do this, make sure the folder with your project is named "dab13" and not "dab13-master" or anything else, it must be dab13 or else Ultra-Safe mode will be enabled. Safe is good.

Use dream daemon to host, Don't use port 9999 or 0, because it enables local testing mode and makes a few debugging stuff enabled.

You need to edit ADMIN_REWORK.dm to change admins. And you need to create a webhook.txt file and webhookAdmin.txt file in the config folder, These are used for the discord webhooks. webhook.txt is a webhook that logs player chat, and webhookAdmin.txt is a adminhelp webhook.

Gamemodes cannot be configured yet.

# Admin Tools / Commands
Admin tools aren't that big. But you may suggest new ones to me. Currently we have main admin features like banning, kicking, sounds, teleporting. etc
