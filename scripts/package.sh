#!/bin/bash -e

set -e

export PACT_MOCK_SERVICE_VERSION=2.0.0 # Seg faults...
export PACT_PROVIDER_VERIFIER_VERSION=0.0.15

# Create the OS specific versions of the mock service and verifier
echo "==> Building Ruby Binaries..."
scripts/build_standalone_packages.sh

# Build each go package for specific OS, bundling the mock service and verifier
echo "==> Creating OS distributions..."
scripts/compile.sh

echo
echo "==> Results:"
ls -hl dist/
