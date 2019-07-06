# Changelog
All notable changes to this project will be documented in this file.

## [0.1.1] - 2019-07-xx
### Fixed
- Less obnoxious header comments in Vagrantfile
- Updated README.md
- Added crude check (/tmp file) to prevent multiple appends to sshd config file
- Changed UFW to stay disabled and require explicit enabling

### Added
- Added this CHANGELOG.MD
- Added TCP 443 as a UFW rule, removed my custom ports
- Added updatedb to script_packages_extra

## [0.1.0] - 2019-06-29
### Added
- Initial release
