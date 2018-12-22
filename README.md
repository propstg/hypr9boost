# hypr9boost
Boost for vehicles, purchasable and usable by everyone.
This only works with ESX.

Import the appropriate sql file under `localization/`.
```
$ mysql -u user -p < en.sql
```

If you want to change values of how much the turbo should do change Config.BoostForce in config.lua.

If you want to change the 3 second delay between activating the nitrous and it taking effect, change Config.DelayBeforeBoost in config.lua. To remove the delay, change to 0.

How to install:

Clone this repo into your resources folder.
Add "start hypr9boost" to your server.cfg, no commas.

How to use:

F2 > Inventory > Nitro > Use
Press E when in a car to use.
