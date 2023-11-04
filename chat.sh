#!/usr/bin/env bash

set -euox pipefail

LLAMA_GGUF_URL='https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q4_K_M.gguf'
LLAMA_GGUF_PATH="$(basename "${LLAMA_GGUF_URL}")"

[[ -f "${LLAMA_GGUF_PATH}" ]] || curl -SLO "${LLAMA_GGUF_URL}"

cat <<EOF | python3
from pprint import pprint
from llama_cpp import Llama
llm = Llama(model_path='${LLAMA_GGUF_PATH}')
pprint(llm('Q: ${1} A: ', max_tokens=32, stop=['Q:', '\n'], echo=True))
EOF
