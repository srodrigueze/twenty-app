# Capa delgada sobre la imagen oficial de Twenty: aqui se personaliza el CRM (version fija + metadatos).
ARG TWENTY_VERSION=v2.26.1
FROM twentycrm/twenty:${TWENTY_VERSION}

ARG GIT_SHA=local
LABEL org.opencontainers.image.title="twenty-crm" \
      org.opencontainers.image.revision="${GIT_SHA}"
