#!/usr/bin/env bash

CWD="$(pwd)"

# Transform arguments into their real paths
real_args=()
for arg in "$@"
do
    real_args+=("$(realpath "$arg")")
done

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR" || exit

# Expand '.' to the actual path
export PYTHONPATH=$(realpath '.')

source .venv/bin/activate

cd $CWD

if [ ${#real_args[@]} -eq 0 ]
then
CMD="python -m mentat"
else
CMD="python -m mentat$(printf ' %q' "${real_args[@]}")"
fi

echo "== Running: $CMD"
bash -c "$CMD"
