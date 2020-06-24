FROM debian:stretch AS builder
RUN apt update && apt install -y curl libicu-dev
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 3.1
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 2.2
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT="true"
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
RUN touch /root/.dotnet/"$(dotnet --version)".dotnetFirstUseSentinel
