#!/usr/bin/env bash
set -euxo pipefail

PROJECT_NAME="${SPHINX_PROJECT_NAME:-DemoProject}"
AUTHOR_NAME="${SPHINX_AUTHOR_NAME:-AH}"

PROJECT_DOCS_DIR="${SPHINX_DOCS_HOME}/${PROJECT_NAME}/docs"

if [ ! -d "${PROJECT_DOCS_DIR}" ]; then
    sphinx-quickstart -q \
                      --project="${PROJECT_NAME}" \
                      --author="${AUTHOR_NAME}" \
                      -v 0.1 \
                      --sep  ${PROJECT_DOCS_DIR}
    sed -i "s/alabaster/default/" ${PROJECT_DOCS_DIR}/source/conf.py
    sed -i '/^html_theme/r /tmp/conf.py.patch' ${PROJECT_DOCS_DIR}/source/conf.py
    make html -C "${PROJECT_DOCS_DIR}"
else
    make clean -C "${PROJECT_DOCS_DIR}"
    make html -C "${PROJECT_DOCS_DIR}"
fi
