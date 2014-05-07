This creates a [Docker](http://docker.io) container for the PAL Sandbox. 

## Installation

You will need a BBC developer certificate which needs to be placed in
`certificates` as `certificate.pem` which contains your private and certificate parts

Clone this repo and run: `docker build -t pal-sandbox .`, this should build
the required container for using the PAL within Docker.

Usually takes about 5 minutes to run as there is A LOT of `yum`ing

