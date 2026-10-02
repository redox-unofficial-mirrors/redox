#!/usr/bin/env bash

SCHEMA_DIR="/usr/share/glib-2.0/schemas"
COMPILED_SCHEMA="$SCHEMA_DIR/gschemas.compiled"

if [ ! -f "$COMPILED_SCHEMA" ]; then
    echo "GSettings schemas are not compiled. Please run"
    echo "sudo glib-compile-schemas $SCHEMA_DIR"
    # otherwise css layout will be broken
    exit 1
fi

# TODO: why?
export GTK_DEBUG=interactive
# TODO: plugin scanner parsing failure
export GST_REGISTRY_DISABLE=yes

exec /usr/libexec/webkit2gtk-4.1/MiniBrowser
