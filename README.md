Util PHP eval-stdin.php (CVE-2017-9841) vulnerability is RCE vulnerability in outdated eval-stdin.php.
This exploit is just automation for mentioned vulnerability and is still in development.

Scripted in Ruby 3.0.4 (within 2 hours), tested on Kali linux, Arch Linux, Ubuntu minimal and Termux.

How to run it?

`ruby evil-eval.rb`

Inside of it, when you type `help` you can see what commands are available such as `revshell`, `checkconnection`, `privesc` which are very, very useful.

When you exit it, you shouldn't do CTRL+C (^C), you can do it by just typing `exit`

DISCLAIMER:

For any misuse or illegal action with this exploit I am totally not responsible.

`Keep calm an 'door the planet`
