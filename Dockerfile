FROM jekyll/builder as builder

WORKDIR /src
COPY drinks .
RUN jekyll build

FROM nginx:1.13-alpine
COPY --from=builder /src/_site/ /usr/share/nginx/html/
