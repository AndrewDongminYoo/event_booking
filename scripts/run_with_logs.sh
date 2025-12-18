#!/usr/bin/env bash
set -u

if [[ $# -lt 3 ]]; then
	echo "Usage: $0 <target-name> -- <command...>" >&2
	exit 1
fi

TARGET="$1"
shift

if [[ $1 != "--" ]]; then
	echo "Expected -- after target name" >&2
	exit 1
fi
shift

CMD=("$@")

# ------------------------------------------------------------
# REDACTED 처리: meta.txt에 기록할 안전한 커맨드 생성
# ------------------------------------------------------------
REDACT_NEXT=false
SAFE_CMD=()

for arg in "${CMD[@]}"; do
	if ${REDACT_NEXT}; then
		SAFE_CMD+=("<REDACTED>")
		REDACT_NEXT=false
		continue
	fi

	case "${arg}" in
	--apiKey | --apiIssuer | --token | --password | --secret | --key | --keyfile | --json_key | --jsonKey)
		SAFE_CMD+=("${arg}")
		REDACT_NEXT=true
		;;
	*=*)
		# KEY=value 형태 (환경변수/토큰 등)
		name="${arg%%=*}"
		if [[ ${name} =~ (KEY|TOKEN|SECRET|PRIVATE|PASSWORD) ]]; then
			SAFE_CMD+=("${name}=<REDACTED>")
		else
			SAFE_CMD+=("${arg}")
		fi
		;;
	*)
		SAFE_CMD+=("${arg}")
		;;
	esac
done

# ------------------------------------------------------------

if [[ ${DRY_RUN:-0} == "1" ]]; then
	echo "[run_with_logs] DRY_RUN=1 (skipping execution)"
	echo "[run_with_logs] WOULD_RUN: ${SAFE_CMD[*]}"
	exit 0
fi

BASE_DIR="${LOG_ROOT:-build/logs}"
SUCCESS_DIR="${BASE_DIR}/success"
FAILURE_DIR="${BASE_DIR}/failure"
LATEST_DIR="${BASE_DIR}/latest"
TMP_ROOT="${BASE_DIR}/.tmp"

mkdir -p "${SUCCESS_DIR}" "${FAILURE_DIR}" "${LATEST_DIR}" "${TMP_ROOT}"

TS="$(date +'%Y%m%d-%H%M%S')"
LOG_BASENAME="${TS}-${TARGET}"

TMP_DIR="${TMP_ROOT}/${LOG_BASENAME}"
mkdir -p "${TMP_DIR}"

STDOUT_LOG="${TMP_DIR}/stdout.log"
STDERR_LOG="${TMP_DIR}/stderr.log"
META_LOG="${TMP_DIR}/meta.txt"
GIT_SHA=$(git rev-parse HEAD 2>/dev/null || echo 'HEAD')

{
	echo "TARGET=${TARGET}"
	echo "TIMESTAMP=${TS}"
	echo "PWD=$(pwd || true)"
	echo "COMMAND=${SAFE_CMD[*]}"
	echo "GIT_SHA=${GIT_SHA}"
} >"${META_LOG}"

echo "[run_with_logs] COMMAND: ${TARGET}"
echo "[run_with_logs] LOGGING: ${TMP_DIR}"

# 실제 커맨드 실행 (원본 CMD 사용)
"${CMD[@]}" >"${STDOUT_LOG}" 2>"${STDERR_LOG}"
STATUS=$?

if [[ ${STATUS} -eq 0 ]]; then
	RESULT_DIR="${SUCCESS_DIR}/${LOG_BASENAME}"
	RESULT="SUCCESS"
else
	RESULT_DIR="${FAILURE_DIR}/${LOG_BASENAME}"
	RESULT="FAILURE"
fi

mv "${TMP_DIR}" "${RESULT_DIR}"

# 최신 로그 심볼릭 링크 갱신
ln -sfn "../${RESULT}/${LOG_BASENAME}" "${LATEST_DIR}/${TARGET}"

echo "[run_with_logs] RESULT: ${RESULT} STATUS: ${STATUS}"
echo "[run_with_logs] DETAIL: ${RESULT_DIR}"

if [[ ${STATUS} -ne 0 ]]; then
	echo "---- tail ${RESULT_DIR}/stderr.log ----"
	tail -n 80 "${RESULT_DIR}/stderr.log" || true
fi

exit "${STATUS}"
