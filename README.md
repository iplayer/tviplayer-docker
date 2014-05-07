This repo is able to set up a host machine with docker & serf installed. The ability to launch new sandboxes with tviplayer running inside of them. 

Follow the READMEs in each of the folders to setup ready to build (mostyl certs) then run:

`./scripts/rebuild.sh` and hope for the best.

If it doesn't work you probably angered some sort of god, fix that relationship first and you should be fine.

Still requires some post launch setup of each node:

- Set domain name and ports `extaccess ec2-45.... ec2-45....:{external static port e.g. 8082} ichef-no-serve`
- `bundle install`
- Grunt build jobs 


