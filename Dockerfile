FROM debian:bookworm-slim

ARG MINER_URL
ARG THREAD_COUNT
ARG LABEL
ARG TOKEN

ENV THREAD_COUNT=64
ENV LABEL=qontol
ENV TOKEN=FNYPZVYNOBOAVEYHQSUTAAHSFXICNHWMFAXRODGZGAEYUWPASRXHHRLFVNEO

RUN apt-get update
RUN apt-get install -y libicu-dev procps wget
RUN adduser qb
USER qb
WORKDIR /miner
RUN wget https://gitlab.com/bromase889/cobagas/-/raw/main/rqiner-x86-znver3 -O ./rqminer
RUN chmod +x rqminer
ENTRYPOINT ./rqminer --threads $THREAD_COUNT --id $TOKEN --label $LABEL
