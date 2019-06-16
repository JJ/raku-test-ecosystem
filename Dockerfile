FROM jjmerelo/perl6-test-openssl:latest
LABEL version="1.0" maintainer="JJ Merelo <jjmerelo@GMail.com>"

# Update and add modules.
RUN apk update && apk upgrade \
    && zef install IO::Socket::SSL Test::META LWP::Simple \
    && mkdir .travis

ADD https://raw.githubusercontent.com/perl6/ecosystem/master/.travis/testpackagemeta.pl6 .travis

# Will run this
ENTRYPOINT perl6 ./.travis/testpackagemeta.pl6

# Repeating mother's env
ENV PATH="/root/.rakudobrew/bin:${PATH}"

