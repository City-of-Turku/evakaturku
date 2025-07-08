#!/bin/bash

# SPDX-FileCopyrightText: 2021 City of Turku
#
# SPDX-License-Identifier: LGPL-2.1-or-later

# Example how to link these customizations to evaka build
set -euo pipefail

EVAKA=../evaka/frontend
CUSTOMIZATIONS="${EVAKA}"/src/lib-customizations/turku

if [ ! -e "${CUSTOMIZATIONS}" ]; then
  ln -v -s $(realpath ./turku) "${CUSTOMIZATIONS}"
else
  echo "${CUSTOMIZATIONS}" already exists: no linking was done
fi
