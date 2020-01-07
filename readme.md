![🐝](https://ixi4jeb43ehhpm46.s3.amazonaws.com/OKKmSvFt5M8t2WaH/i-am-home-now-i-love-u-sleep-tight.png "🐝")

<h3 align="center">a shell script for macOS that automatically opens Messages.app and texts your best friend "i am home now i love u sleep tight" when you open your laptop after you get home after hanging out w them</h3>

---

### Features

1. Uses [SleepWatcher ↗](https://www.bernhard-baehr.de/) to run automatically when your computer wakes from sleep during specified hours (_default_ 11pm—4am).
2. Checks your location (roughly) to make sure you're home (doesn't text your friends when you're not home)
3. Custom messages and configurable hours
4. Sometimes messages your best friend "i'm thinking about u" during the day (5% chance when u open your laptop outside of configured hours)

### Why

my friends always ask me to do this and i always forget. i love them a lot

## Installation

> ⚠️ don't install this if you don't know what you're doing!!!! shell commands are pretty serious apparantly and can do some wonky ass shit to ur computer !!!! i texted my best friend w this 50+ times by accident while i was making this and it was just because i didn't the volume on my computer turned up !!!!!! ⚠️

<details><summary style="margin-left:26px">Install SleepWatcher</summary>
<p>

<code style="margin-left:26px">\$ brew install sleepwatcher</code>

<blockquote style="margin-left:26px">

Q — What is this? 💭

A — [SleepWatcher ↗](https://www.bernhard-baehr.de/) allows us to run shell commands when your computer wakes from sleep

_Note_ — If you already have SleepWatcher configured on your computer, just run `_i-am-home-now-i-love-u-sleep-tight.sh` from your `~/.wakeup` file

</blockquote>

</p>
</details>

1. Clone this repo and `cd` into it. ⤵
   ```
   git clone https://github.com/mwvd/i-am-home-now-i-love-u-sleep-tight.git && cd i-am-home-now-i-love-u-sleep-tight
   ```
   > ⚠️ if you ever want to move this repo, move it now lol. it will save u 1000 headaches later
2. Rename your new files ⤵
   ```
   mv _i-am-home-now-i-love-u-sleep-tight.plist i-am-home-now-i-love-u-sleep-tight.plist && mv _i-am-home-now-i-love-u-sleep-tight.sh i-am-home-now-i-love-u-sleep-tight.sh
   ```
3. Let ♡computer know that our `.sh` file is a friend ⤵
   ```
   chmod +x i-am-home-now-i-love-u-sleep-tight.sh
   ```
4. [Config 🔗](#Configuration)
5. In `i-am-home-now-i-love-u-sleep-tight.plist`, change the path on line 11 to where you have saved `i-am-home-now-i-love-u-sleep-tight.sh`
6. Symlink our prop file to SleepWatcher's
   ```bash
   ln -sfv /path/to/i-am-home-now-i-love-u-sleep-tight.plist ~/Library/LaunchAgents/com.oschrenk.sleepwatcher.plist
   ```
7. Load SleepWatcher `fuck a restart`

   ```bash
   launchctl load ~/Library/LaunchAgents/com.oschrenk.sleepwatcher.plist
   ```

### Weird stuff

- Remember to escape weird characters in your messages with `\`
- You might have to `chmod` a bunch of shit

## Configuration

There are several options to configure inside `i-am-home-now-i-love-u-sleep-tight.sh` ⤵

```bash
home="City"
# your home. check by running `$ curl https://ipinfo.io/city -s` when ur at home


n=23
# what hour (24h) you want this script to start running (11pm here)
m=4
# what hour (24h) you want this script to stop running (4am here)

# ↑ your message sends if the time right now is >= $n, or < $m
# In this example this means that if you wake your computer between 11pm-4am
# after hanging out w them, this script will automatically send them a message
# letting them know you are home


b="Your Best Friend"
# the name of your best friend (they need to be in your contacts)
# idk if this is first names, first name + last name, nickname or what. my best
# friend is saved as an emoji so at least u know that works too

message="i am home now i love u sleep tight"
# message to send ur best friend to let them know you are home safe and sound
# and that u love them — triggers if time right now is >= $n, or > $m

thinkin="thinking about u :)"
# message to send your best friend to let them know you are thinking about them
# the command to send this message  has a 1/20 chance of triggering when your
# computer wakes _outside_ of your $n & $m hours. don't bother ur friends.
```

## Uninstall

```bash
$ unlink /path/to/i-am-home-now-i-love-u-sleep-tight.plist
$ unlink ~/Library/LaunchAgents/com.oschrenk.sleepwatcher.plist # just to be safe
$ launchctl unload ~/Library/LaunchAgents/com.oschrenk.sleepwatcher.plist
$ brew uninstall sleepwatchers
```

restart and then do a fresh OS install just to be safe

## Notes

- macOS only - sorry :(
- You can disable the randomized "thinking about u" messages by removing the `elif` statement in `_i-am-home-now-i-love-u-sleep-tight.sh`
- This uses iMessage. I'm sure you could get it working p easily w Twilio or something if you wanted to
- Don't use this as a substitute for being safe. When your friends ask you to text them when you get home safe, they really just want to know that you're safe. This app doesn't prove you're safe it just proves that you can install and run LaunchDaemons

- text ur friends lol. they love u

---

<details><summary>To Do</summary>
<p>

- [ ] set a timeout
- [ ] remember to text my friends lol :(

</p>
</details>
