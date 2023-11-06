#!/usr/bin/env bash

set -euox pipefail

LLAMA_GGUF_URL='https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q4_K_M.gguf'
LLAMA_GGUF_PATH="$(basename "${LLAMA_GGUF_URL}")"

[[ -f "${LLAMA_GGUF_PATH}" ]] || curl -SLO "${LLAMA_GGUF_URL}"

cat <<EOF | python3
from pprint import pprint
from llama_cpp import Llama
llm = Llama(model_path='${LLAMA_GGUF_PATH}')
prompt = '''[INST] <<SYS>>
You are a helpful, respectful and honest assistant. Always answer as helpfully as possible, while being safe.  Your answers should not include any harmful, unethical, racist, sexist, toxic, dangerous, or illegal content. Please ensure that your responses are socially unbiased and positive in nature. If a question does not make any sense, or is not factually coherent, explain why instead of answering something not correct. If you don't know the answer to a question, please don't share false information.
<</SYS>>
{}[/INST]
'''.format('${*}')
pprint(llm(prompt, max_tokens=1024, echo=True))
EOF
