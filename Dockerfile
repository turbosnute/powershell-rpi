FROM raspbian/stretch
ENV PWSH_VERSION 7.0.0
RUN apt-get update
RUN apt-get install --no-install-recommends -y \
  libunwind8 \
  libicu57 \
  libcurl4-openssl-dev \
  cron
RUN wget -O pwsh.tar.gz  https://github.com/PowerShell/PowerShell/releases/download/v$PWSH_VERSION/powershell-$PWSH_VERSION-linux-arm32.tar.gz
RUN mkdir ~/powershell
RUN tar -xvf ./pwsh.tar.gz -C ~/powershell
RUN ln -s ~/powershell/pwsh /usr/bin/pwsh
RUN ln -s ~/powershell/pwsh /usr/local/bin/powershell
RUN sudo rm -rf /var/lib/apt/lists
RUN rm pwsh.tar.gz
CMD ["pwsh"]

