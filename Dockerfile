FROM debian:stable-slim

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y ca-certificates curl && \
    rm -r /var/lib/apt/lists /var/cache/apt/archives

# kube-explorer
RUN curl -LO https://github.com/cnrancher/kube-explorer/releases/download/v0.2.8/kube-explorer-linux-amd64 && \
    mv kube-explorer-linux-amd64 /kube-explorer && \
    chmod +x /kube-explorer

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
RUN mkdir -p /home/appuser && chown -R appuser:appuser /home/appuser

USER appuser
WORKDIR /home/appuser

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]