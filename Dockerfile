FROM ubuntu:20.04
RUN apt-get update && apt-get install -y sudo curl python3-pip

RUN groupadd -r newuser && useradd -r -g newuser newuser
RUN adduser newuser sudo
RUN adduser --disabled-password \
--gecos '' docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn


RUN mkdir -p /home/newuser
RUN chown -R 999:999 /home/newuser

RUN mkdir -p /project
RUN chown -R 999:999 /project
RUN chmod -R 777 /project

RUN npm install -g npm@7.16.0
RUN npm install -g npm@7.16.0



#USER newuser
#WORKDIR /home/newuser

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
RUN bash -c "$(curl -sSfL https://release.solana.com/v1.5.7/install)"
RUN . $HOME/.cargo/env
ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"
ENV RUST_LOG="solana_runtime::system_instruction_processor=trace,solana_runtime::message_processor=debug,solana_bpf_loader=debug,solana_rbpf=debug"

WORKDIR /project

ENTRYPOINT ["/bin/bash"]







