#!/bin/bash

# Git 저장소 경로 설정 (본인의 경로로 변경)
REPO_PATH="/home/ubuntu/github-grass-bot"

# 커밋 메시지 설정
COMMIT_MESSAGE="잔디 심기 봇: $(date +%Y-%m-%d_%H-%M-%S)"

# 커밋할 파일 경로 설정
TARGET_FILE="$REPO_PATH/commit_log.txt"

# 현재 시간을 추가할 내용
NEW_LINE="## 잔디 심기 커밋: $(date +%Y년 %m월 %d일 %H시 %M분 %S초)"

# 새로운 라인을 target_file에 추가 (현재 시간을 추가)
echo "$NEW_LINE" >> "$TARGET_FILE"

cd "$REPO_PATH" || exit

# 변경 사항 추가
git add .

# 커밋
git commit -m "$COMMIT_MESSAGE"

# GitHub에 푸시
git push https://"$GRASSBOT_TOKEN"@github.com/XZero92/grassBot.git main

echo "자동 커밋 및 푸시 완료: $COMMIT_MESSAGE"
