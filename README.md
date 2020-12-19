![image build and push](https://github.com/mehmetahsen/stoken-docker/workflows/image%20build%20and%20push/badge.svg?branch=master)

# stoken-docker

**tl;dr**: [cernekee/stoken](https://github.com/cernekee/stoken) in a container. 

It's based  on [cernekee's PPA](https://launchpad.net/~cernekee/+archive/ppa) as [described here](https://sourceforge.net/p/stoken/wiki/Home/).
Entrypoint is `stoken` itself, therefore any params to container will be passed as is. See [stoken docs](https://github.com/cernekee/stoken#usage) for more information on how to use it.

To provide persistency, `/root` is designated as a volume. If you like to import a seed file, put it in a directory and mount it when running the container. stoken keeps a file named `.stokenrc` there.

## How?
1. Add token seed.
2. Generate token.

It's possible to run stoken without password and also without a pin using `stoken setpin`, refer to [stoken docs](https://github.com/cernekee/stoken#usage).

### Add a random seed

```bash
read -s SEED_PASSWORD
docker run --rm --interactive --volume ~/stoken:/root mehmetahsen/stoken import --random <<EOF                                          
$SEED_PASSWORD
$SEED_PASSWORD
EOF
```

### Generate a token
```bash
read -s SEED_PASSWORD
STOKEN_PIN='0000' # No pin default
docker run --rm --interactive --volume ~/stoken:/root mehmetahsen/stoken <<EOF
$SEED_PASSWORD
$STOKEN_PIN
EOF
```
