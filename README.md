This repo is able to set up a host machine with docker & serf installed. The ability to launch new sandboxes with tviplayer running inside of them.

This repo requires Ubuntu 14.04 or greater, Since 14 Docker is now a native package and fully supported.

Installation
------------

Run `./scripts/setupHost.sh` to install and setup docker and serf on the host.

You will need a BBC developer certificate which needs to be placed in
`pal-sandbox/certificates/certificate.pem` and should contain your private & certificate parts one after the other.

You also need to add a certificate that will allow access to github (to clone private stuff) in `tviplayer-sandbox/github-key.pem`.

Then run `./scripts/rebuild.sh` and hope for the best.

If it doesn't work you probably angered some sort of god, fix that relationship first and you should be fine.

