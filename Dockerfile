FROM golang:1.12.6 AS certs

FROM scratch
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY "./build/hlstats" "/"
EXPOSE 8755
CMD ["/hlstats"]