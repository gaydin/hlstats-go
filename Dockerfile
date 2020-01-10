FROM golang:1.13.5 AS certs

FROM scratch
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY "./build/hlstats" "/"
EXPOSE 8755
CMD ["/hlstats"]