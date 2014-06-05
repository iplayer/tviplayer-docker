This repo is able to set up a host machine with docker & serf installed. The ability to launch new sandboxes with tviplayer running inside of them. 

Installation
------------

Run `./scripts/setupHost.sh` to ....setup the host machine. Installs docker and serf on the host.

You will need a BBC developer certificate which needs to be placed in `pal-sandbox/certificates` as `certificate.pem` which contains your private & certificate parts one after the other.

You also need to add a certificate that will allow access to github (to clone private stuff). Place it in  `tviplayer-sandbox/` as `github-key.pem`.

Same goes for your SSH Key (to allow you to SSH in to container). Place your public key in `tviplayer-sandbox` as  `host-key.pub`.

Then run `./scripts/rebuild.sh` and hope for the best.

If it doesn't work you probably angered some sort of god, fix that relationship first and you should be fine.

Still requires some post launch setup of each node:

- Set domain name and ports `extaccess ec2-45.... ec2-45....:{external static port e.g. 8082} ichef-no-serve`
- `bundle install`
- Grunt build jobs 


