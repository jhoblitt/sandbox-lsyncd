#!/bin/bash

if [[ "$SSH_ORIGINAL_COMMAND" == rsync\ --server* ]]; then
    $SSH_ORIGINAL_COMMAND
else
    echo "rejected"
fi
