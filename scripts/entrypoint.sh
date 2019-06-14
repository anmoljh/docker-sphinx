#!/usr/bin/env bash
set -eux
set -o pipefail

PROJECT_NAME="${SPHINX_PROJECT_NAME:-DemoProject}"
AUTHOR_NAME="${SPHINX_AUTHOR_NAME:-AH}"

PROJECT_DOC_DIR="${SPHINX_DOCS_HOME}/${PROJECT_NAME}/docs"

if [ ! -d "${PROJECT_DOC_DIR}" ]; then
    sphinx-quickstart -q \
                      --project="${PROJECT_NAME}" \
                      --author="${AUTHOR_NAME}" \
                      -v 0.1 \
                      --sep  ${PROJECT_DOC_DIR}
    sed -i "s/alabaster/default/" ${PROJECT_DOC_DIR}/source/conf.py
    sed -i '/^html_theme/r /tmp/conf.py.patch' ${PROJECT_DOC_DIR}/source/conf.py
    make html -C "${PROJECT_DOC_DIR}"
else
    make clean -C "${PROJECT_DOC_DIR}"
    make html -C "${PROJECT_DOC_DIR}"
fi
