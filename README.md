# hypr9boost
Boost for vehicles, purchasable and usable by everyone.
This only works with ESX.

Import the appropriate sql file under `localization/`.
```
$ mysql -u user -p < en.sql
```

If you want to change values of how much the turbo should do change Config.BoostForce in config.lua.

If you don't want to keep the 3 second delay or want to lower it, set Config.DelayBeforeBoost to 0 in config.lua.

How to install:

Clone this repo into your resources folder.
Add "start hypr9boost" to your server.cfg, no commas.

How to use:

F2 > Inventory > Nitro > Use
Press E when in a car to use.
