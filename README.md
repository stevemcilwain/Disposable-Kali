# Disposable-Kali                                          

This project contains a vagrant file that spins up my preferred Kali Linux customizations.  I attempted to make most of the scripting modular, so you can comment out steps you don't want.  If find something horribly wrong or want to add new goodies then just issue a pull request.  Hope you find this useful!

## Prerequisites

You'll need to have the following ready before you can use this:

1. A suitable host operating system, I'm using Ubuntu
2. Oracle Virtual Box 6 installed and working
3. Hashicorp Vagrant installed and working (tested with v2.25)

## Installing

Git clone the repo, then navigate to the folder in terminal/cmd and "vagrant up".  After the everything completes you can then use "vagrant ssh" to login to Kali as root.

## Firewall Notes

Note that one of the scripts I run installs UFW and enables it.  I open certain ports I use to catch reverse shells.  You may want to add your own, or not enable UFW by default.  There's nothing worse than trying an exploit for an hour only to realize you are blocking your own reverse shell connection!!!!

## Built With

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Kali Linux](https://www.kali.org/)

## Contributing

Please create an issue describing the changes to be merged.

## Authors

* **Steve Mcilwain** - *Initial work* - [gulfsteve](https://github.com/gulfsteve)

See also the list of [contributors](https://github.com/gulfsteve/Disposable-Kali/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
